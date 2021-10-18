import 'package:flutter/material.dart';

import 'package:flutter_qrcode_maps/widgets/scan_list.dart';

class AdressesScreen extends StatelessWidget {
  
   const AdressesScreen({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
      
      return const ScanList(iconList: Icons.http,);
   }
}