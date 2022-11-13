import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:ungserviceofficer/utility/my_constant.dart';
import 'package:ungserviceofficer/widgets/widget_text.dart';

class ReadQR extends StatefulWidget {
  const ReadQR({super.key});

  @override
  State<ReadQR> createState() => _ReadQRState();
}

class _ReadQRState extends State<ReadQR> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? barcode;
  String? resultBarcode;
  QRViewController? qrViewController;
  DateTime dateTime = DateTime.now();

  @override
  void reassemble() {
    super.reassemble();

    if (Platform.isAndroid) {
      qrViewController!.pauseCamera();
    } else {
      qrViewController!.resumeCamera();
    }
  }

  @override
  void dispose() {
    qrViewController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: WidgetText(
          text: 'Read QR code 123',
          textStyle: MyConstant().h2Style(),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            qrCamera(),
            showResult(),
            WidgetText(text: dateTime.toString())
          ],
        ),
      ),
    );
  }

  Widget showResult() {
    return resultBarcode == null
        ? const SizedBox()
        : WidgetText(
            text: resultBarcode!,
            textStyle: MyConstant().h2Style(),
          );
  }

  Container qrCamera() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: MyConstant().curveBorder(),
      width: 250,
      height: 250,
      child: QRView(
        key: qrKey,
        onQRViewCreated: (p0) {
          qrViewController = p0;

          qrViewController!.scannedDataStream.listen((event) {
            if (resultBarcode == null) {
              resultBarcode = event.code;
              print('resultBarcode ==> $resultBarcode');
              qrViewController!.stopCamera();
              setState(() {});
            } else {
              resultBarcode = null;
            }
          });
        },
      ),
    );
  }
}
