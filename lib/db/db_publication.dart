import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class DBPublication {
  static late Database _db;
  static Database get db => _db;

  static Future open() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'publication.db');

    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users(
            id INTEGER primary key,
            name TEXT,
            phone TEXT,
            email TEXT
          )
        ''');
      },
    );
  }

  static Future close() async {
    await _db.close();
  }
}
