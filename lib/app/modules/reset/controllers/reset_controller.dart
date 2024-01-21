import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../core/model/request_model/auth/reset_password_model.dart';
import '../../../data/api_endpoints.dart';
import '../../../routes/app_pages.dart';

class ResetController extends GetxController {
  final RxBool isPasswordVisible = true.obs;

  final passwordController = TextEditingController().obs;
  final otpController = TextEditingController().obs;
  final formFieldKey = GlobalKey<FormState>();

  final email = "".obs;

  @override
  void onInit() {
    super.onInit();
    email.value = Get.arguments[0];
  }

  @override
  void dispose() {
    passwordController.value.dispose();
    super.dispose();
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 5) {
      return 'Password must be at least 5 characters';
    }
    return null;
  }

  goToLogIn() => Get.toNamed(Routes.LOGIN);

  Future<void> forgetPasswordEmail(String otp, String password) async {
    if (formFieldKey.currentState!.validate()) {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.resetPass);

      List<dynamic> arguments = Get.arguments;
      String email = arguments[0];

      if (email.isNotEmpty) {
        var requestBody = jsonEncode(
          ResetPasswordModel(email: email, otpCode: otp, password: password),
        );

        http.Response response =
            await http.post(url, body: requestBody, headers: headers);

        if (response.statusCode == 200) {
          final json = jsonDecode(response.body);
          if (json['status'] == "Success") {
            Get.toNamed(Routes.LOGIN);
          } else if (json["status"] == "Success") {
            throw jsonDecode(response.body)["message"];
          }
        } else if (response.statusCode == 400) {
          throw jsonDecode(response.body)["message"];
        } else {
          throw jsonDecode(response.body)["message"] ?? "UNKNOWN ERROR";
        }
      } else {
        throw "Invalid email, name, or password";
      }
    }
  }
}
