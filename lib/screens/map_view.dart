import 'dart:async';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter_qrcode_maps/models/scan.dart';

class MapViewScreen extends StatefulWidget {
  
   const MapViewScreen({Key? key}) : super(key: key);

   @override
   State<MapViewScreen> createState() => _MapViewScreenState();
}

class _MapViewScreenState extends State<MapViewScreen> {

   final Completer<GoogleMapController> _controller = Completer();
   MapType maptype = MapType.normal;

   @override
   Widget build(BuildContext context) {

      final ScanModel scan = ModalRoute.of(context)!.settings.arguments as ScanModel;
      
      final CameraPosition initialPosition = CameraPosition(
         target: scan.getLatLng(),
         zoom: 14.4746,
      );

      /// Marcadores
      // ignore: prefer_collection_literals
      Set<Marker> markers = Set<Marker>();
      markers.add(
         Marker(
            markerId: const MarkerId('geo'),
            position: scan.getLatLng(),
         )
      );

      return Scaffold(
         appBar: AppBar(
            actions: [
               IconButton(
                  icon: const Icon(Icons.location_on_outlined),
                  onPressed: () async {
                     final CameraPosition position = CameraPosition(
                        target: scan.getLatLng(),
                        zoom: 14.4746,
                     );
                     final GoogleMapController controller = await _controller.future;
                     controller.animateCamera(CameraUpdate.newCameraPosition(position));
                  }, 
               )
            ],
         ),
         body:  GoogleMap(
            myLocationEnabled: true,
            markers: markers,
            mapType: maptype,
            initialCameraPosition: initialPosition,
            onMapCreated: (GoogleMapController controller) {
               _controller.complete(controller);
            },
         ),
         floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.layers),
            onPressed: () {

               if (maptype == MapType.normal) {
                  maptype = MapType.satellite;
               } else {
                  maptype = MapType.normal;
               }

               setState(() {});
            },

         ),
      );
   }
}