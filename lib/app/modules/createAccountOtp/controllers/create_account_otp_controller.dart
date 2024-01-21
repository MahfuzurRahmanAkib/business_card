import 'package:business_card_api/app/data/repository/create_act_otp_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class CreateAccountOtpController extends GetxController {
  final otpController = TextEditingController().obs;
  final pinController = TextEditingController().obs;
  final formFieldKey = GlobalKey<FormState>();

  final email = "".obs;
  final name = "".obs;
  final password = "".obs;

  final otp = "".obs;

  @override
  void onInit() {
    super.onInit();
    email.value = Get.arguments[0];
    name.value = Get.arguments[1];
    password.value = Get.arguments[2];
  }

  Future<void> otpForCreateAccount(String otp) async {
    bool ok = await CreateAccountOtpRepository.otpForCreateAccount(otp);
    if (ok) {
      Get.toNamed(Routes.LOGIN);
    } else {
      Get.snackbar("", 'Failed to delete');
    }
  }
}
