import 'dart:io';

import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

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
}