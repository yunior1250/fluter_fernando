// o servicios

//simgletom

import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart';



/*

class DBProvider {
Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();
 
  Future<Database?> get database async { //En esta parte aumente un ? en <Database?>
 
    if( _database == null) _database = await initDB();
    return _database;
  }

  Future<Database> initDB()async {
    //path donde optenemos la base de atos

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    //162131315
    final path = join(documentsDirectory.path,'ScansDB.db');
    print(path);
    //creacion de la base de datos
    return  await openDatabase(
          path,
          version: 1,
          onOpen: (db){},
          onCreate: (Database db, int version)async {
            await db.execute('''
              CREATE TABLE Scans(
                id INTEGER PRIMARY KEY,
                title TEXT,
                value TEXT
              )

           ''' );

          },
    );

  }
}


*/

import 'package:path/path.dart';
//import 'package:qr_reader_lite/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
 
class DBProvider {
  static const _databaseName = "ScansDB.db";
  static const _databaseVersion = 1;
 
  static const table = 'Scans';
 
  static const columnId = 'id';
  static const columnName = 'tipo';
  static const columnAge = 'valor';
 
  Database? _database;
 
  Future<Database?> get database async {
    if (_database != null) return _database;
 
    _database = await init();
 
    return _database;
  }
 
  // this opens the database (and creates it if it doesn't exist)
  Future init() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
        print(path);
    _database = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
    return _database;
  }
 
  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnAge TEXT NOT NULL
          )
          ''');
  }
 /*
  Future<int?> nuevoScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db?.insert('Scans', nuevoScan.toJson());
    print(res);
    // Es el ID del último registro insertado;
    return res;
  }
  */
}