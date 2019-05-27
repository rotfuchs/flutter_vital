
import 'package:flutter_vital/core/Database/SQLite/SQLiteDb.dart';
import 'package:flutter_vital/core/Service/BloodPressure/Model/BloodPressure.dart';
import 'package:flutter_vital/core/Service/BloodPressure/Repository/Filter/BloodPressureFilter.dart';
import 'package:sqflite/sqflite.dart';

class BloodPressureRepository {
  Database _database;

  Future<bool> save(BloodPressure bp) async {
    var db = await _getDb();
    var bpMap = bp.toMap();

    bpMap.remove("id");
    bpMap['created'] = bp.created.toIso8601String();

    if(bp.id!=null) {
      await db.update(
          "blood_pressure_data",
          bpMap,
        where: "id = ?",
        whereArgs: [ bp.id ]
      );
      return true;
    } else {
      bp.id = await db.insert("blood_pressure_data", bpMap);
      return (bp.id>0);
    }
  }

  Future<bool> delete(BloodPressure bp) async {
    var db = await _getDb();
    var changes = 0;

    if(bp.id != null && bp.id > 0) {
      changes = await db.delete(
          "blood_pressure_data",
          where: "id = ?",
          whereArgs: [ bp.id ]
      );
      return (changes>0);
    }
    return false;
  }

  Future<List<BloodPressure>> filter(BloodPressureFilter filter) async {
    final db = await _getDb();

    final List<Map<String, dynamic>> items = await db.query(
        "blood_pressure_data",
        orderBy: filter.orderBy,
        limit: filter.limit,
        offset: filter.offset
    );

    return List.generate(items.length, (i) {
      var item = new BloodPressure();

      item.id = items[i]['id'];
      item.created = DateTime.parse(items[i]['created']);
      item.pulse = items[i]['pulse'].toDouble();
      item.diastolic = items[i]['diastolic'].toDouble();
      item.systolic = items[i]['systolic'].toDouble();

      return item;
    });
  }

  Future<BloodPressure> getSingle(int id) async {
    final db = await _getDb();

    final List<Map<String, dynamic>> items = await db.query(
        "blood_pressure_data",
        where: "id = ?",
        whereArgs: [ id ]
    );

    var item = new BloodPressure();
    if(items.length==1) {
      item.id = items[0]['id'];
      item.created = new DateTime(items[0]['created']);
      item.pulse = items[0]['pulse'].toDouble();
      item.diastolic = items[0]['diastolic'].toDouble();
      item.systolic = items[0]['systolic'].toDouble();
    }
    return item;
  }

  Future<Database> _getDb() async {
    if (_database != null)
      return _database;

    _database = await SQLiteDb.db.database;

    return _database;
  }
}