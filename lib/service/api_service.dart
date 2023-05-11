import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shoppy/service/api_status.dart';

class ApiService {

  static Future<Object?> apiGetCall({required String url}) async {
    try {
      var uri = Uri.parse(url);
      var response = await http.get(uri).timeout(const Duration(seconds: 30));
      if (response.statusCode == 200) {
        log("URL:- $url \n Response:- ${response.body}");
        return Success(response: response.body);
      }
    } on HttpException {
      return Failure(response: "Http Exception");
    } on SocketException {
      return Failure(response: "Http Exception");
    } on FormatException {
      return Failure(response: "Http Exception");
    } on TimeoutException {
      return Failure(response: "Http Exception");
    } on Exception catch (error) {
      return Failure(response: "Catch Exception $error");
    }
  }

  static Future<Object?> apiPostCall({required String url, required var body}) async {
    try {
      var uri = Uri.parse(url);
      var response = await http.post(uri, body: body).timeout(const Duration(seconds: 30));
      if (response.statusCode == 200) {
        log("URL:- $url \n Response:- ${response.body}");
        return Success(response: response.body);
      }
    } on HttpException {
      return Failure(response: "Http Exception");
    } on SocketException {
      return Failure(response: "Http Exception");
    } on FormatException {
      return Failure(response: "Http Exception");
    } on TimeoutException {
      return Failure(response: "Http Exception");
    } on Exception catch (error) {
      return Failure(response: "Catch Exception $error");
    }
  }


}
