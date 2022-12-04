import 'dart:convert';

import 'package:http/http.dart';

abstract class ResponserServices {
  static dynamic responserHttp(Response resp) {
    final dynamic decodedData = json.decode(resp.body);
    if (resp.statusCode >= 200 && resp.statusCode < 300) {
      return decodedData;
    } else {
      throw decodedData.forEach((k, v) => throw "$k: $v");
    }
  }
}
