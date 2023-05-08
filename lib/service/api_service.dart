import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiService {
  static Future<Object?> apiGetCall({required String url}) async {
    try {
      var uri = Uri.parse(url);
      var response = await http.get(uri).timeout(const Duration(seconds: 30));
      if (response.statusCode == 200) {
        log("URL:- $url \n Response:- ${response.body}");
      }
    } on HttpException {
    } on SocketException {
    } on FormatException {
    } on TimeoutException {
    } on Exception catch (e) {}
  }
}
