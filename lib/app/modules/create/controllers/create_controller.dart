import 'package:business_card_api/app/data/repository/create_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class CreateController extends GetxController {
  final RxBool isPasswordVisible = true.obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final nameController = TextEditingController().obs;

  @override
  void dispose() {
    nameController.value.dispose();
    emailController.value.dispose();
    passwordController.value.dispose();
    super.dispose();
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      Get.snackbar("", 'Please enter a password');
    } else if (value.length < 5) {
      Get.snackbar("", 'Password must be more than 5 character');
    }
    return null;
  }

  void goToLogin() => Get.toNamed(Routes.LOGIN);

  Future<void> createAccount(String email, String name, String password) async {
    bool ok = await CreateRepository.createAccount(email, name, password);
    if (ok) {
      Get.toNamed(Routes.CREATE_ACCOUNT_OTP, arguments: [
        email,
        name,
        password,
      ]);
    } else {
      Get.snackbar("", 'Failed to delete account');
    }
  }
}
