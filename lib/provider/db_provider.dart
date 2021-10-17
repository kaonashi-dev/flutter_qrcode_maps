import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:flutter_qrcode_maps/models/scan.dart';
export 'package:flutter_qrcode_maps/models/scan.dart';

class DBProvider{

   static Database? _database;
   static final DBProvider db = DBProvider._();

   DBProvider._();

   Future<Database?> get database async {

      if( _database != null ) return _database;

      _database = await initDB();

      return _database;
   }

   Future<Database> initDB() async{

      /// Path de la base de datos
      Directory documentDir = await getApplicationDocumentsDirectory();

      final path = join( documentDir.path, 'ScansDatabase.db' );
      // ignore: avoid_print
      print(path);

      /// Crear base de datos
      return await openDatabase(
         path,
         version: 1,
         onOpen: (Database db) {},
         onCreate: (Database db, int version) async {

            await db.execute(
               '''
                  CREATE TABLE scans(
                     id INTEGER PRIMARY KEY,
                     type TEXT,
                     value TEXT
                  );
               '''
            );

         }
      );
   }

   ///Crear un registro 
   Future<int?> newScan( ScanModel newScan ) async{

      final db = await database;
      final response = await db?.insert('Scans', newScan.toJson());

      return response;
   }

   /// Conseguir registro por id
   Future<ScanModel?> getScanById( int id ) async{

      final db = await database;
      final response = await db?.query('Scans', where: 'id = ?', whereArgs: [id]);

      return (response!.isNotEmpty) ? ScanModel.fromJson(response.first) : null;
   }

   /// Conseguir registro por el tipo
   Future<List<ScanModel>?> getScanByType( String type ) async{

      final db = await database;
      final response = await db?.query('Scans', where: 'type = ?', whereArgs: [type]);

      return (response!.isNotEmpty) ? response.map((scan) => ScanModel.fromJson(scan)).toList() : [];
   }

   /// Conseguir todos los registros
   Future<List<ScanModel>?> getAllScans() async{

      final db = await database;
      final response = await db?.query('Scans');

      return (response!.isNotEmpty) ? response.map((scan) => ScanModel.fromJson(scan)).toList() : [];
   }

   /// Actualizar registro
   Future<int?> updateScan(ScanModel scan) async{

      final db = await database;
      final response = await db?.update('Scans', scan.toJson(), where: 'id = ?', whereArgs: [scan.id]);
      
      return response;

   }

   /// Eliminar registro
   Future<int?> deleteScan(int id) async{
      final db = await database;
      final response = await db?.delete('Scans', where: 'id = ?', whereArgs: [id]);
      
      return response;

   }

   /// Eliminar todos los registro
   Future<int?> deleteAllScan() async{
      final db = await database;
      final response = await db?.delete('Scans');
      
      return response;

   }
}