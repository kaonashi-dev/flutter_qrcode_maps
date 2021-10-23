import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));

String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
   ScanModel({
      this.id,
      this.type,
      required this.value,
   }) {
      type = (value.contains('geo')) ? 'geo' : 'http';
   }

   int? id;
   String? type;
   String value;

   factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
      id: json["id"],
      type: json["type"],
      value: json["value"],
   );
   Map<String, dynamic> toJson() => {
      "id": id,
      "type": type,
      "value": value,
   };

   LatLng getLatLng(){

      final latlng = value.substring(4).split(',');
      final lat = double.parse(latlng[0]);   
      final lng = double.parse(latlng[1]);   

      return LatLng(lat, lng);
   }
}
