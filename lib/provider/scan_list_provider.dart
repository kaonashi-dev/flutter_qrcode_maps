import 'package:flutter/foundation.dart';

import 'package:flutter_qrcode_maps/provider/db_provider.dart';

class ScanListProvider extends ChangeNotifier{

   List<ScanModel> scansList = [];
   String selectdType = 'http';
   
   /// Agregar un Scan
   newScan( ScanModel newScan ) async {

      newScan.id = await DBProvider.db.newScan(newScan);

      if ( selectdType ==  newScan.type ) {
         scansList.add(newScan);
         notifyListeners();
      }
   }

   /// Cargar todos los Scans
   loadAllScans() async {
      final List<ScanModel>? scans = await DBProvider.db.getAllScans();
      scansList = [...?scans];
      notifyListeners();
   }

   /// Cargar Scans por tipo
   loadScansByType(String type) async {
      final List<ScanModel>? scans = await DBProvider.db.getScanByType(type);
      scansList = [...?scans];
      selectdType = type;
      notifyListeners();
   }

   /// Eliminar todos los Scans
   deleteAllScans() async {
      await DBProvider.db.deleteAllScan();
      scansList = [];
      notifyListeners();
   }

   deleteScanById( int id ) async {
      await DBProvider.db.deleteScan(id);
      loadScansByType( selectdType );
   }
}