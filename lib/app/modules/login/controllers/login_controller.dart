import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../core/model/request_model/auth/sign_in_model.dart';
import '../../../core/model/response_model/login_response_model.dart';
import '../../../data/api_endpoints.dart';
import '../../../data/shared_value_model.dart';
import '../../../routes/app_pages.dart';
import '../../bottomNavBar/views/bottom_nav_bar_view.dart';

class LoginController extends GetxController {
  final formFieldKey = GlobalKey<FormState>();
  RxString finalEmail = ''.obs;
  final RxBool isPasswordVisible = true.obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    if (kDebugMode) {
      emailController.value.text = "daxis44847@wikfee.com";
      passwordController.value.text = "12345678";
    }
  }

  @override
  void dispose() {
    emailController.value.dispose();
    passwordController.value.dispose();
    super.dispose();
  }

  void goToSignIn() => Get.toNamed(Routes.CREATE);

  void goToForgetPage() => Get.toNamed(Routes.FORGET);

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      Get.snackbar("", 'Please enter a password');
    } else if (value.length < 5) {
      Get.snackbar("", 'Password must be more than 5 character');
    }
    return null;
  }

  Future<void> userLogin(String email, String password) async {
    if (formFieldKey.currentState!.validate()) {
      var headers = {'Content-Type': 'application/json'};
      var url =
          Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.login);

      SignInModel signInModel =
          SignInModel(username: email, password: password);
      String requestBody = signInModelToJson(signInModel);

      http.Response response =
          await http.post(url, body: requestBody, headers: headers);

      if (response.statusCode == 200) {
        LoginResponseModel responseModelValue =
            loginResponseModelFromJson(response.body);
        bearerToken.$ = responseModelValue.data!.apiToken.toString();
        token.$ = responseModelValue.data!.apiToken.toString();
        token.save();
        bearerToken.save();
        token.load();
        bearerToken.load();
        saveValue();
        loadValue();

        Get.off(const BottomNavBarView());
      } else {
        Get.snackbar("", 'Failed to login account');
      }
    }
  }
}
