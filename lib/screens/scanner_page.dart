// ignore_for_file: deprecated_member_use

import 'dart:io' show Platform;

import 'package:attendance_app/screens/employee_page_first.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart'; 

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({super.key});

  @override
  State<QRScannerPage> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    } else if (Platform.isIOS) {
      controller?.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              cameraFacing: CameraFacing.front,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text(
                      'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                  : const Text('Scan a code'),
            ),
          )
        ],
      ),
    );
  }

void _onQRViewCreated(QRViewController controller) {
  this.controller = controller;
  controller.scannedDataStream.listen((scanData) {
    setState(() {
      result = scanData;
    });

    // Navigate directly to EmployeePage after any QR code scan
    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyFirstHomePage()),
      );
    }
  });
}

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
