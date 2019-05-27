
import 'package:flutter_vital/core/Database/SQLite/SQLiteDb.dart';
import 'package:flutter_vital/core/Service/BloodPressure/Model/BloodPressure.dart';
import 'package:flutter_vital/core/Service/BloodPressure/Repository/Filter/BloodPressureFilter.dart';
import 'package:sqflite/sqflite.dart';

class BloodPressureRepository {
  Future<Database> _database;

  BloodPressureRepository() {
    _database = SQLiteDb.db.database;
  }

  Future<bool> save(BloodPressure bp) async {
    return false;
  }

  Future<bool> delete(BloodPressure bp) async {
    return false;
  }

  Future<List<BloodPressure>> filter(BloodPressureFilter filter) async {
    return [];
  }
}