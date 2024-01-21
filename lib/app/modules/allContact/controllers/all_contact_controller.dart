import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../card/views/card_view.dart';
import '../../contact/class/contact_list.dart';
import '../../contact/views/contact_view.dart';
import '../../scan/views/scan_view.dart';
import '../../settings/views/settings_view.dart';

class AllContactController extends GetxController {
  final specialIndex = 69.obs;
  final selectedIndex = 0.obs;
  final List<dynamic> screens = [
    const CardView(),
    const ScanView(),
    const ContactView(),
    const SettingsView(),
  ].obs;
  List<ContactsLists> contactList = [];
  final totalContact = 0.obs;
  final searchController = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    contactList = Get.arguments[0];
    totalContact.value = contactList.length;
    specialIndex.value = 28;
  }

  @override
  void onReady() {
    super.onReady();
    specialIndex.value = 28;
  }

  @override
  void onClose() {
    super.onClose();
    specialIndex.value = 28;
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
