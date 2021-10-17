import 'package:flutter/material.dart';
import 'package:flutter_qrcode_maps/provider/scan_list_provider.dart';

import 'package:provider/provider.dart';

// import 'package:flutter_qrcode_maps/provider/db_provider.dart';
import 'package:flutter_qrcode_maps/provider/ui_provider.dart';

import 'package:flutter_qrcode_maps/screens/addresses_screen.dart';

import 'package:flutter_qrcode_maps/screens/map_screen.dart';
import 'package:flutter_qrcode_maps/widgets/navigationbar.dart';
import 'package:flutter_qrcode_maps/widgets/scan_button.dart';

class HomeScreen extends StatelessWidget {
  
   const HomeScreen({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
      return Scaffold(
         appBar: AppBar(
            centerTitle: true,
            title: const Text('Historial'),
            actions: [
               IconButton(
                  onPressed: () {}, 
                  icon: const Icon( Icons.delete_forever )
               )
            ],
         ),
         
         body: _HomeScreenBody(),

         floatingActionButton: const ScanButton(),
         floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,

         bottomNavigationBar: const Navigationbar(),
      );
   }
}

class _HomeScreenBody extends StatelessWidget {

   @override
   Widget build(BuildContext context) {

      /// Obtener el selectedOpt del provider
      final uiprovider = Provider.of<UiProvider>(context);
      
      final currentIndex = uiprovider.selectedOpt;

      /// test db
      // final temp = ScanModel(value: 'https://google.com');
      // DBProvider.db.getAllScans().then((item) => print(item));

      final scansListProvider = Provider.of<ScanListProvider>(context, listen: false);

      /// Para mostrar la pagina
      switch (currentIndex) {
         case 0:
            scansListProvider.loadScansByType('geo');
            return const MapScreen();
         
         case 1:
            scansListProvider.loadScansByType('http');
            return const AdressesScreen();

         default:
            return const MapScreen();
      }

   }
}