import '../models/user_model.dart';
import 'serverAPI_services.dart';

abstract class ListUserServices {
  static Future<List<UserModel>> getListUser() async {
    try {
      final List<UserModel> list = [];
      final users = await ServerAPIServices.serviceGet("users");
      for (var user in users) {
        list.add(UserModel.fromMap(user));
      }
      return list;
    } catch (e) {
      rethrow;
    }
  }
}
