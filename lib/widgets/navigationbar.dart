import 'package:flutter/material.dart';

class Navigationbar extends StatelessWidget {
   
   const Navigationbar({Key? key}) : super(key: key);
   
   final currentIndex = 0;

   @override
   Widget build(BuildContext context) {
      return BottomNavigationBar(
         currentIndex: currentIndex,
         items: const<BottomNavigationBarItem> [
            BottomNavigationBarItem(
               icon: Icon(Icons.map_outlined),
               label: 'Mapas',
            ),
            BottomNavigationBarItem(
               icon: Icon(Icons.navigation_outlined),
               label: 'Direcciones',
            ),
         ]
      );
   }
}