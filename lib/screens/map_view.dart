import 'package:flutter/material.dart';
import 'package:flutter_qrcode_maps/models/scan.dart';

class MapViewScreen extends StatelessWidget {
  
   const MapViewScreen({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {

      final ScanModel scan = ModalRoute.of(context)!.settings.arguments as ScanModel;

      return Scaffold(
         body: Center(
            child: Text(scan.value)
         ),
      );
   }
}