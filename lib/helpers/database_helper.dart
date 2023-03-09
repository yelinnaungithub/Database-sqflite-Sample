import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

import '../model/book.dart';

class DatabaseHelper {
  String columnId = 'id';
  String dbName = 'bookStore';
  String tableName = 'book';
  String columnBookName = 'bookName';
  String columnBookAuthor = 'bookAuthor';
  String columnBookPrice = 'bookPrice';

  Database? _database;

  Future<Database> getDatabase() async {
    var dbPath = await getDatabasesPath();
    return await openDatabase(p.join(dbPath, dbName),
        onCreate: _dbCreate, version: 1);
  }

  void _dbCreate(Database db, int version) {
    String sql =
        'CREATE TABLE $tableName ($columnId INTEGER PRIMARY KEY AUTOINCREMENT, $columnBookName CHAR, $columnBookAuthor CHAR,$columnBookPrice INTEGER)';
    db.execute(sql);
  }

  Future<int> insertData(Book book) async {
    _database = await getDatabase();
    int result = await _database!.insert(tableName, book.toMap());
    return result;
  }

  Future<int> updatetData(Book book, int id) async {
    _database = await getDatabase();
    book.id = id;
    int result = await _database!.update(tableName, book.toMap(),where: 'id = ?', whereArgs: [id]);
    return result;
  }

 Future<List<Book>> getAllData() async{
    _database = await getDatabase();
    List<Map<String, dynamic>> maps =await _database!.query(tableName);
    var result = maps.map((e) => Book.fromMap(e)).toList();
    return result;
  }

}
