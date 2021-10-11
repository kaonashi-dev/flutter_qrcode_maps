import 'package:flutter/material.dart';

// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButton extends StatelessWidget {
   const ScanButton({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
      return FloatingActionButton(
         child: const Icon( Icons.qr_code),
         onPressed: () async {
            // String scanRes = await FlutterBarcodeScanner.scanBarcode('#F9F1F0', 'CANCELAR', false, ScanMode.QR);
            String scanRes = 'https://www.google.com/';
            // ignore: avoid_print
            print(scanRes);
         },
      );
   }
}