import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_app/helper/cart_controller.dart';
import 'package:hotel_app/screens/home/home_screen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScannerScreen extends StatefulWidget {
  static String routeName = "/qr_scanner";
  QrScannerScreen({Key? key}) : super(key: key);

  @override
  State<QrScannerScreen> createState() => QrScannerScreenState();
}

class QrScannerScreenState extends State<QrScannerScreen> {
  Barcode? result;
  QRViewController? controller;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: _buildQrView(context)));
  }

  _navigateToHome(String id) {
    Get.put(CartController()).upDateId(id);
   Get.to(HomeScreen());
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 200
        : 300;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea.toDouble()),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        scanData.code != null ? controller.stopCamera() : null;
        if (result!.code.toString().length != 20) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Invalid QR Code')));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Welcome")));
          _navigateToHome(result!.code.toString());
          
        }
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please grant camera permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
