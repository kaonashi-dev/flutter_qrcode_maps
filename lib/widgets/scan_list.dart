import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_qrcode_maps/provider/scan_list_provider.dart';
import 'package:flutter_qrcode_maps/utils/utils.dart';

class ScanList extends StatelessWidget {

   final IconData? iconList;

  const ScanList({Key? key, this.iconList}) : super(key: key);

   @override
   Widget build(BuildContext context) {
      
      final scansListProvider = Provider.of<ScanListProvider>(context);
      
      return ListView.builder(
         itemCount: scansListProvider.scansList.length,
         itemBuilder: (BuildContext _, int index) {
            return Dismissible(
               key: UniqueKey(),
               background: Container(
                  color: Colors.redAccent,
               ),
               onDismissed: (DismissDirection direction) {
                  Provider.of<ScanListProvider>(context, listen: false).deleteScanById(scansListProvider.scansList[index].id!);
               },
               child: ListTile(
                  
                  leading: Icon(iconList, color: Theme.of(context).primaryColor,),
                  title: Text(scansListProvider.scansList[index].value.toString()),
                  subtitle: Text(scansListProvider.scansList[index].id.toString()),
                  trailing: const Icon( Icons.arrow_right_alt, color: Colors.black ),
                  onTap: () => {
                     launchURL(context, scansListProvider.scansList[index])
                  }
               
               ),
            );
         }
      );
   }
}