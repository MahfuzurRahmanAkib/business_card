import 'package:business_card_api/app/core/model/response_model/card_transfer_response_model.dart';
import 'package:business_card_api/app/modules/login/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/model/response_model/user_information_response_model.dart';
import '../../../data/repository/act_details_repository.dart';
import '../../../data/shared_value_model.dart';
import '../../../routes/app_pages.dart';
import '../../card/views/card_view.dart';
import '../../contact/views/contact_view.dart';
import '../../scan/views/scan_view.dart';
import '../../settings/views/settings_view.dart';
import '../views/account_details_view.dart';

class AccountDetailsController extends GetxController {
  final cIndex = 0.obs;
  final selectedIndex = 0.obs;

  final oldPassController = TextEditingController().obs;
  final newPassController = TextEditingController().obs;

  final newEmail = TextEditingController().obs;
  final newEmailOtp = TextEditingController().obs;

  final userInformation = UserInformationResponseModel().obs;
  final cardTransferResponseModel = CardTransferResponseModel().obs;

  final List<dynamic> screens = [
    const CardView(),
    const ScanView(),
    const ContactView(),
    const SettingsView()
  ].obs;

  @override
  void onInit() {
    super.onInit();
    getUserInformation();
  }

  void backToSettings() => Get.toNamed(Routes.SETTINGS);

  void goToUpdate() => Get.toNamed(Routes.UPDATE);

  Future<void> getUserInformation() async {
    userInformation.value = await AccountDetailsRepository.getDetails();
  }

  Future<void> logout() async {
    Get.offAndToNamed(Routes.LOGIN);
    bool ok = await AccountDetailsRepository.logout();
    if (ok) {
      clearUser();
      Get.off(const LoginView());
    } else {
      Get.snackbar("", "Failed Logout Account");
    }
  }

  Future<void> getCardTransferList() async {
    cardTransferResponseModel.value =
        await AccountDetailsRepository.getCardTransferList();
  }

  Future<void> deleteAccount() async {
    Get.offAndToNamed(Routes.LOGIN);
    bool ok = await AccountDetailsRepository.deleteAccount();
    if (ok) {
      clearUser();
      Get.off(const LoginView());
    } else {
      Get.snackbar("", "Failed Delete Account");
    }
  }

  Future<void> changePassword(String oldPassword, String newPassword) async {
    bool ok =
        await AccountDetailsRepository.changePassword(oldPassword, newPassword);
    if (ok) {
      Get.off(const AccountDetailsView());
    } else {
      Get.snackbar("", "Failed to change password");
    }
  }

  Future<void> changeEmail(String email) async {
    bool ok = await AccountDetailsRepository.changeEmail(email);
    if (ok) {
      Get.off(const AccountDetailsView());
    } else {
      Get.snackbar("", "Failed to change email");
    }
  }

  Future<void> changeEmailWithOtp(String email, String otp) async {
    var ok = await AccountDetailsRepository.changeEmailWithOtp(email, otp);
    if (ok) {
      Get.off(const AccountDetailsView());
    } else {
      Get.snackbar("", "Failed to change email with OTP");
    }
  }
}
