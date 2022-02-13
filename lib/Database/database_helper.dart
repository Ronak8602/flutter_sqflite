import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static const _dbName = "my_database.db";
  static const _dbVersion = 1;
  static const _tableName = "myTable";
  static const _columnId = "_id";
  static const _columnName = "name";

  static Database? _database;

  Future<Database> get database async =>
    _database ??= await _initializeDatabase();

  Future<Database>_initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);
    return await openDatabase(path,
        version: _dbVersion, onCreate: _onCreate(_database!, _dbVersion));
  }

  _onCreate(Database db, int version) {
    db.execute('''
      CREATE TABLE $_tableName(
      $_columnId INTEGER PRIMARY KEY,
      $_columnName TEXT NOT NULL
      )
       ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return db.insert(_tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await instance.database;
    return db.query(_tableName);
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[_columnId];
    return await db
        .update(_tableName, row, where: '$_columnId = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return db.delete(_tableName, where: '$_columnId = ?', whereArgs: [id]);
  }
}
