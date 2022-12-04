import 'package:ceiba_publicaciones/services/serverAPI_services.dart';

import '../models/post_model.dart';

abstract class ListPostServices {
  static Future<List<PostModel>> getListPostUser(int userId) async {
    try {
      final List<PostModel> list = [];
      final posts = await ServerAPIServices.serviceGet(
        "posts",
        parament: {
          "userId": userId.toString(),
        },
      );
      for (var post in posts) {
        list.add(PostModel.fromMap(post));
      }
      return list;
    } catch (e) {
      rethrow;
    }
  }
}
