import 'package:flutter/material.dart';

import '../models/post_model.dart';

class PostProviver extends ChangeNotifier {
  List<PostModel> _posts = [];
  List<PostModel> get posts => _posts;
  set posts(List<PostModel> p) {
    _posts = p;
    notifyListeners();
  }

  late bool _loading = true;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
