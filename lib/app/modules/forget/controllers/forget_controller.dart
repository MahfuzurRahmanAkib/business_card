import 'package:business_card_api/app/data/repository/forget_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class ForgetController extends GetxController {
  final formFieldKey = GlobalKey<FormState>();
  final emailController = TextEditingController().obs;

  @override
  void dispose() {
    emailController.value.dispose();
    super.dispose();
  }

  void goToLogin() => Get.toNamed(Routes.LOGIN);

  void goToReset() => Get.toNamed(Routes.RESET);

  Future<void> forgetPasswordEmail(String email) async {
    bool ok = await ForgetRepository.forgetPasswordEmail(email);
    if (ok) {
      Get.toNamed(Routes.RESET, arguments: [
        email,
      ]);
    } else {
      Get.snackbar("", 'Failed to forget account');
    }
  }
}
