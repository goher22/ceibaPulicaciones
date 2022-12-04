import 'package:flutter/material.dart';

import '../models/user_model.dart';

class UserProvider extends ChangeNotifier {
  String _shearchUser = "";
  String get shearchUser => _shearchUser;
  set shearchUser(String shearch) {
    _shearchUser = shearch;
    notifyListeners();
  }

  List<UserModel> _users = [];
  List<UserModel> get users => _shearchUser.trim() == ""
      ? _users
      : _users.where((us) => us.name.contains(_shearchUser)).toList();
  set users(List<UserModel> list) {
    _users = list;
    notifyListeners();
  }

  late UserModel _user;
  UserModel get user => _user;
  set user(UserModel u) {
    _user = u;
    notifyListeners();
  }

  late bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
