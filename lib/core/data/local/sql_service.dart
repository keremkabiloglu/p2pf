import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../model/column_model.dart';

class SqlService {
  final String _dbName = "database.db";
  late final Database _database;

  Future<void> _initDatabase() async {
    String path = join(await getDatabasesPath(), _dbName);
    _database = await openDatabase(path,
        version: 1, onCreate: (Database db, int version) => null);
  }

  Future<void> _checkDatabase() async {
    if (!_database.isOpen) await _initDatabase();
  }

  Future<void> _closeDatabase() async {
    await _database.close();
  }

  String generateColumnString(List<ColumnModel> columns) {
    String columnString = "";
    for (var column in columns) {
      columnString += column.toString();
    }
    return columnString;
  }

  /// IMPORTANT: Primary 'ID' parameter is automaticly impelemented. Do not add ID parameter
  Future<void> createTable(
      {required String name, required List<ColumnModel> columns}) async {
    await _checkDatabase();
    await _database.execute(
        'CREATE TABLE IF NOT EXISTS $name (id INTEGER PRIMARY KEY, ${generateColumnString(columns)})');
    await _closeDatabase();
  }

  Future<int?> insertItem(
      {required String tableName,
      required List<String> columns,
      required List<dynamic> values}) async {
    await _checkDatabase();
    int? id;
    await _database.transaction((txn) async {
      id = await txn
          .rawInsert('INSERT INTO $tableName ($columns) VALUES ($values)');
    });
    await _closeDatabase();
    return id;
  }

  Future<void> updateItem(
      {required String tableName,
      required int itemIndex,
      required List<String> columns,
      required List<dynamic> values}) async {
    await _checkDatabase();
    for (var column in columns) {
      column = column + ' = ?';
    }
    await _database.rawUpdate(
        'UPDATE $tableName SET $columns WHERE id = $itemIndex', values);
    await _closeDatabase();
  }

  Future<dynamic> getItemWithId(
      {required String tableName, required int id}) async {
    await _checkDatabase();
    List<Map<String, Object?>> object =
        await _database.rawQuery("SELECT * FROM $tableName WHERE id = $id");
    await _closeDatabase();
    return object.isNotEmpty ? object.first : null;
  }

  Future<List<Map<String, Object?>>> getAllItems(String tableName) async {
    await _checkDatabase();
    List<Map<String, Object?>> items =
        await _database.rawQuery("SELECT * FROM $tableName");
    await _closeDatabase();
    return items;
  }
}
