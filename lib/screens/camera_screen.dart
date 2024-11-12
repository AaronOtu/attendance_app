import 'package:attendance_app/screens/firstpage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:path_provider/path_provider.dart';
import 'dart:io';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final ImagePicker _picker = ImagePicker();
  File? _image;

  @override
  void initState() {
    super.initState();
    _openCamera();
  }

  // Method to open the camera
  Future<void> _openCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera,preferredCameraDevice: CameraDevice.front);
    

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // Method to save image
  Future<void> _saveImageLocally() async {
    if (_image == null) return;

   // final directory = await getApplicationDocumentsDirectory();
   // final imagePath = '${directory.path}/saved_image.jpg';
   // final imageFile = await _image!.copy(imagePath);

    if (mounted) {
      // Navigator.push(context, MaterialPageRoute(builder: (context)=> const CameraPage()));
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyFirstPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a Picture')),
      body: Center(
        child: _image != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.file(_image!),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _saveImageLocally,
                        child: const Text('Use Photo'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: _openCamera,
                        child: const Text('Retake'),
                      ),
                    ],
                  ),
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
