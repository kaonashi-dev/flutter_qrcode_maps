import 'package:flutter/material.dart';
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
      
      final currentIndex = 0;

      switch (currentIndex) {
         case 0:
            return MapScreen();
         
         case 1:
            return AdressesScreen();

         default:
            return MapScreen();
      }

   }
}