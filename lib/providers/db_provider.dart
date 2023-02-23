import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:qrreaderfer/models/scan_model.dart';
export 'package:qrreaderfer/models/scan_model.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  static Database? _database;

  static final DBProvider db = DBProvider._internal();
  DBProvider._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');
    print(path);
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: ((db, version) async {
      await db.execute('''
        create table Scans(
          id integer primary key,
          tipo text,
          valor text
        )
      ''');
    }));
  }

  nuevoScanRaw(ScanResultModel scan) async {
    final db = await database;
    final res = await db.rawInsert('''
                          insert into Scans(id, tipo, valor)
                          values ( ${scan.id}, ${scan.tipo}, ${scan.valor} )
                      ''');
    return res;
  }

  Future<int> nuevoScan(ScanResultModel scan) async {
    final db = await database;
    final res = db.insert('Scans', scan.toJson());
    return res;
  }

  Future<ScanResultModel?> getScanById(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id=?', whereArgs: [id]);
    return res.isNotEmpty ? ScanResultModel.fromJson(res.first) : null;
  }

  Future<List<ScanResultModel>> getScans() async {
    final db = await database;
    final res = await db.query('Scans');
    return res.isNotEmpty
        ? res.map((e) => ScanResultModel.fromJson(e)).toList()
        : [];
  }

  Future<List<ScanResultModel>> getScansByType(String type) async {
    final db = await database;
    final res = await db.query('Scans', where: 'tipo= ?', whereArgs: [type]);
    return res.isNotEmpty
        ? res.map((e) => ScanResultModel.fromJson(e)).toList()
        : [];
  }

  Future<int> putScan(ScanResultModel scan) async {
    final db = await database;
    final res = await db
        .update('Scans', scan.toJson(), where: 'id=?', whereArgs: [scan.id]);
    return res;
  }

  Future<int> deleteById(int id) async {
    final db = await database;
    final res = await db.delete('Scans', where: 'id=?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteByType(String type) async {
    final db = await database;
    final res = await db.delete('Scans', where: 'tipo=?', whereArgs: [type]);
    return res;
  }

  Future<int> deleteAll() async {
    final db = await database;
    final res = await db.delete('Scans');
    return res;
  }
}
