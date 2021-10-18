import 'package:flutter/material.dart';
import 'package:flutter_qrcode_maps/widgets/scan_list.dart';

class MapScreen extends StatelessWidget {
  
   const MapScreen({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {

      return const ScanList(iconList: Icons.maps_home_work);

   }
}