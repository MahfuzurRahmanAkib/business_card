import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../core/model/request_model/auth/create_otp_model.dart';
import '../api_endpoints.dart';

class CreateAccountOtpRepository {
  static Future<bool> otpForCreateAccount(String otp) async {
    var headers = {'Content-Type': 'application/json'};
    var url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.createForOtp);

    List<dynamic> arguments = Get.arguments;

    String email = arguments[0];
    String name = arguments[1];
    String password = arguments[2];

    var requestBody = jsonEncode(
      CreateOtpModel(
        name: name,
        username: email,
        email: email,
        otp: otp,
        password: password,
      ),
    );

    http.Response response =
        await http.post(url, body: requestBody, headers: headers);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw "Invalid email, name, or password";
    }
  }
}
