import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_qrcode_maps/provider/ui_provider.dart';

class Navigationbar extends StatelessWidget {
   
   const Navigationbar({Key? key}) : super(key: key);
   
   final currentIndex = 0;

   @override
   Widget build(BuildContext context) {

      /// Obtener el selectedOpt del provider
      final uiprovider = Provider.of<UiProvider>(context);

      return BottomNavigationBar(
         currentIndex: uiprovider.selectedOpt,
         onTap: (int index) => uiprovider.selectedOpt = index,
         items: const<BottomNavigationBarItem> [
            BottomNavigationBarItem(
               icon: Icon(Icons.map_outlined),
               label: 'Mapas',
            ),
            BottomNavigationBarItem(
               icon: Icon(Icons.open_in_browser_sharp),
               label: 'Direcciones',
            ),
         ]
      );
   }
}