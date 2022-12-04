import 'package:ceiba_publicaciones/services/server_sqlite_service.dart';

import '../models/user_model.dart';
import 'serverAPI_services.dart';

abstract class ListUserServices {
  static Future<List<UserModel>> getListUser() async {
    try {
      final List<UserModel> list = [];
      bool insert = false;
      late List<dynamic> users;
      users = await ServerSqliteService.serviceGet("users");
      if (users.isEmpty) {
        print("Consultando al servidor");
        insert = true;
        users = await ServerAPIServices.serviceGet("users");
      }
      for (var user in users) {
        UserModel userModel = UserModel.fromMap(user);
        if (insert) {
          await ServerSqliteService.serviceInsert("users", userModel.toMap());
        }
        list.add(userModel);
      }
      return list;
    } catch (e) {
      rethrow;
    }
  }
}
