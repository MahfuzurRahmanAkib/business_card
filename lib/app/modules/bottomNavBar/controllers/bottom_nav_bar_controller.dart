import 'package:business_card_api/app/modules/card/views/card_view.dart';
import 'package:business_card_api/app/modules/contact/views/contact_view.dart';
import 'package:business_card_api/app/modules/scan/views/scan_view.dart';
import 'package:business_card_api/app/modules/settings/views/settings_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  final selectedIndex = 0.obs;
  final cIndex = 0.obs;

  static const List<Widget> widgetOptions = [
    CardView(),
    ScanView(),
    ContactView(),
    SettingsView()
  ];

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
