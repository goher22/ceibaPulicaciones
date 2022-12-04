import 'package:flutter/material.dart';

import '../models/user_model.dart';
import 'serverAPI_services.dart';

abstract class ListUserServices {
  static Future<List<UserModel>> getListUser() async {
    try {
      final List<UserModel> list = [];
      final resp = await ServerAPIServices.serviceGet("users");
      for (var element in resp as List) {
        list.add(UserModel.fromMap(element));
      }
      return list;
    } catch (_) {
      rethrow;
    }
  }
}
