import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'responser_services.dart';

abstract class ServerAPIServices {
  static final String _UrlBase = dotenv.env["URL_BASE"] ?? "";

  static final headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  static Future<dynamic> serviceGet(
    String path, {
    Map<String, dynamic>? parament,
  }) async {
    try {
      final url = Uri.https(_UrlBase, path, parament);
      final resp = await http.get(url, headers: headers);
      final data = ResponserServices.responserHttp(resp);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> servicePost(
    String path,
    String? body,
    Map<String, dynamic>? parament,
  ) async {
    try {
      final url = Uri.https(_UrlBase, path, parament);
      final resp = await http.post(url, headers: headers, body: body);
      final data = ResponserServices.responserHttp(resp);
      return data;
    } catch (_) {
      rethrow;
    }
  }
}
