import 'dart:convert';

import '../../core/model/request_model/auth/sign_in_model.dart';
import '../api_endpoints.dart';

import 'package:http/http.dart' as http;

class LoginRepository {
  static Future<bool> userLogin(String email, String password) async {
    var headers = {'Content-Type': 'application/json'};
    var url =
        Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.login);

    SignInModel signInModel = SignInModel(username: email, password: password);
    String requestBody = signInModelToJson(signInModel);

    http.Response response =
        await http.post(url, body: requestBody, headers: headers);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw jsonDecode(response.body)["message"] ?? "UNKNOWN ERROR";
    }
  }
}
