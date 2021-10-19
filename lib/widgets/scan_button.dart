import 'package:flutter/material.dart';
import 'package:flutter_qrcode_maps/models/scan.dart';
import 'package:flutter_qrcode_maps/utils/utils.dart';

import 'package:provider/provider.dart';

import 'package:flutter_qrcode_maps/provider/scan_list_provider.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButton extends StatelessWidget {
   const ScanButton({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
      return FloatingActionButton(
         child: const Icon( Icons.qr_code),
         onPressed: () async {

            String scanRes = await FlutterBarcodeScanner.scanBarcode('#F9F1F0', 'CANCELAR', false, ScanMode.QR);

            if(scanRes != '-1') {
                  
               final scansListProvider = Provider.of<ScanListProvider>(context, listen: false);
               final newScan = ScanModel(type: 'http', value: scanRes);
               scansListProvider.newScan(newScan);

               launchURL(context, newScan);

            }
         },
      );
   }
}