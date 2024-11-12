import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VisitorPage extends StatefulWidget {
  const VisitorPage({super.key});

  @override
  State<VisitorPage> createState() => _VisitorPageState();
}

class _VisitorPageState extends State<VisitorPage> {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController organisationController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController hostController = TextEditingController();
  TextEditingController carNumberController = TextEditingController();
  bool light = false;
  bool dark = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              FontAwesomeIcons.angleLeft,
              color: Colors.red,
            ),
          ),
        ),
        title: const Text(
          'Visitor Actions',
          style: TextStyle(color: Colors.red, fontSize: 15),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.08, // 8% of screen width padding
          vertical: screenHeight * 0.05,  // 5% of screen height padding
        ),
        children: [
          TextField(
            decoration: const InputDecoration(hintText: 'Fullname'),
            controller: fullnameController,
          ),
          SizedBox(height: screenHeight * 0.04), // 4% of screen height
          TextField(
            decoration: const InputDecoration(hintText: 'Organisation'),
            controller: organisationController,
          ),
          SizedBox(height: screenHeight * 0.04),
          TextField(
            decoration: const InputDecoration(hintText: 'Phone number'),
            controller: phoneNumberController,
          ),
          SizedBox(height: screenHeight * 0.04),
          TextField(
            decoration: const InputDecoration(hintText: 'Host'),
            controller: hostController,
          ),
          SizedBox(height: screenHeight * 0.04),
          TextField(
            decoration: const InputDecoration(hintText: 'Car Number (GR-789-20)'),
            controller: carNumberController,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const Text(
                    'Purpose of Visit:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Switch(
                    value: light,
                    activeColor: Colors.red,
                    onChanged: (value) {
                      setState(() {
                        light = value;
                        if (dark && light) dark = false; 
                      });
                    },
                  ),
                  const Text('Official'),
                  Switch(
                    value: dark,
                    activeColor: Colors.red,
                    onChanged: (value) {
                      setState(() {
                        dark = value;
                        if (light && dark) light = false; 
                      });
                    },
                  ),
                  const Text('Personal'),
                ],
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.05),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.02, // Button height as 2% of screen height
              ),
            ),
            child: const Text('SUBMIT'),
          ),
        ],
      ),
    );
  }
}
