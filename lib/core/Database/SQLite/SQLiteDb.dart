import 'dart:async';

import 'package:flutter_vital/config.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteDb {
  static final SQLiteDb db = SQLiteDb._();
  static Database _database;

  SQLiteDb._();

  initDB() async {
    return await openDatabase(
      join(await getDatabasesPath(), sqLiteDatabaseName),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE blood_pressure_data(" +
              "id INTEGER "+
              "constraint blood_pressure_data_pk "+
              "primary key autoincrement, "+
              "created DATETIME NOT NULL, "+
              "pulse DOUBLE NOT NULL, "+
              "diastolic DOUBLE NOT NULL, "+
              "systolic DOUBLE NOT NULL"+
          ");"
        );
      },
      version: 1,
    );
  }

  Future<Database> get database async {
    if (_database != null)
      return _database;

    _database = await initDB();
    return _database;
  }
}
