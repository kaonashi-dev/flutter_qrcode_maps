import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_qrcode_maps/models/scan.dart';

void launchURL(BuildContext context, ScanModel scan) async {

   if(scan.type == 'http') {
      await canLaunch(scan.value) ? await launch(scan.value) : throw 'Could not launch ${scan.value}';
   }else{
      Navigator.pushNamed(context, 'map', arguments: scan);
   }
}