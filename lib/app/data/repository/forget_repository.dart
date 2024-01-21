import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/model/request_model/auth/forget_password_email.dart';
import '../api_endpoints.dart';

class ForgetRepository {
  static Future<bool> forgetPasswordEmail(String email) async {
    var headers = {'Content-Type': 'application/json'};
    var url =
        Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.resetEmail);

    ForgetPasswordModel forgetPasswordModel = ForgetPasswordModel(email: email);
    String requestBody = forgetPasswordModelToJson(forgetPasswordModel);

    http.Response response =
        await http.post(url, body: requestBody, headers: headers);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw jsonDecode(response.body)["message"] ?? "UNKNOWN ERROR";
    }
  }
}
