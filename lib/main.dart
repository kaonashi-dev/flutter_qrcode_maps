import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_qrcode_maps/provider/scan_list_provider.dart';
import 'package:flutter_qrcode_maps/provider/ui_provider.dart';

import 'package:flutter_qrcode_maps/screens/home_screen.dart';
import 'package:flutter_qrcode_maps/screens/map_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

   const MyApp({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {

      Color primaryColor = Colors.purple;

      return MultiProvider(
         providers: [
            ChangeNotifierProvider(create: (_) => UiProvider()),
            ChangeNotifierProvider(create: (_) => ScanListProvider()),
         ],
         child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'QR reader',
            initialRoute: 'home',
            routes: {
               'home': ( _ ) => const HomeScreen(),
               'map': ( _ )  => const MapViewScreen(),
            },
            theme: ThemeData.light().copyWith(
               primaryColor: primaryColor,
               floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: primaryColor
               )
            ),
         ),
      );
   }
}