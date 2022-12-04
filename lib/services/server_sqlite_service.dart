import '../db/db_publication.dart';

abstract class ServerSqliteService {
  static Future serviceInsert(String table, Map<String, dynamic> data) async {
    try {
      await DBPublication.open();
      await DBPublication.db.insert(table, data);
      await DBPublication.close();
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> serviceGet(String table) async {
    try {
      await DBPublication.open();
      final resp = await DBPublication.db.query(table);
      await DBPublication.close();
      return resp;
    } catch (e) {
      rethrow;
    }
  }
}
