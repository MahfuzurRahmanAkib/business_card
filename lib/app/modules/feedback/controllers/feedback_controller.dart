import 'package:business_card_api/app/data/repository/feedback_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../card/views/card_view.dart';
import '../../contact/views/contact_view.dart';
import '../../scan/views/scan_view.dart';
import '../../settings/views/settings_view.dart';

class FeedbackController extends GetxController {
  final feedbackController = TextEditingController().obs;

  final cIndex = 0.obs;
  final selectedIndex = 0.obs;
  final List<dynamic> screens =
      [const CardView(), const ScanView(), const ContactView(), const SettingsView()].obs;

  @override
  void dispose() {
    feedbackController.value.dispose();
    super.dispose();
  }

  Future<void> createFeedback(String feedback) async {
    bool ok = await FeedbackRepository.createFeedback(feedback);
    if (ok) {
      Get.toNamed(Routes.SETTINGS);
    } else {
      Get.snackbar("", 'Failed to create feedback');
    }
  }
}
