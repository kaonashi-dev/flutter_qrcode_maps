import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_qrcode_maps/provider/db_provider.dart';
import 'package:flutter_qrcode_maps/provider/scan_list_provider.dart';

class MapScreen extends StatelessWidget {
  
   const MapScreen({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {

      final scansListProvider = Provider.of<ScanListProvider>(context);

      return ListView.builder(
         itemCount: scansListProvider.scansList.length,
         itemBuilder: (BuildContext _, int index) {
            return ListTile(
               
               leading: Icon(Icons.map, color: Theme.of(context).primaryColor,),
               title: Text(scansListProvider.scansList[index].value.toString()),
               subtitle: Text(scansListProvider.scansList[index].id.toString()),
               trailing: const Icon( Icons.arrow_right_alt, color: Colors.black ),
               onTap: () => {}

            );
         }
      );
   }
}