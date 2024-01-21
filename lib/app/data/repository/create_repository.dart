import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/model/request_model/auth/create_with_email_model.dart';
import '../api_endpoints.dart';

class CreateRepository {
  static Future<bool> createAccount(String email, String name, String password) async {
    var headers = {'Content-Type': 'application/json'};
    var url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.createWithEmail);

    CreateWithEmailModel createWithEmailModel =
        CreateWithEmailModel(username: email, name: name, password: password);
    String requestBody = createWithEmailModelToJson(createWithEmailModel);

    http.Response response =
        await http.post(url, body: requestBody, headers: headers);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw jsonDecode(response.body)["message"] ?? "UNKNOWN ERROR";
    }
  }
}
