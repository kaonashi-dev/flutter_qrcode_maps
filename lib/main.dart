import 'package:flutter/material.dart';
import 'package:flutter_qrcode_maps/provider/ui_provider.dart';

import 'package:provider/provider.dart';

import 'package:flutter_qrcode_maps/screens/home_screen.dart';
import 'package:flutter_qrcode_maps/screens/map_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

   const MyApp({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {

      Color primaryColor = Colors.purple;

      return MultiProvider(
         providers: [
            ChangeNotifierProvider(create: (_) => UiProvider())
         ],
         child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'QR reader',
            initialRoute: 'home',
            routes: {
               'home': ( _ ) => const HomeScreen(),
               'map': ( _ )  => const MapScreen(),
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