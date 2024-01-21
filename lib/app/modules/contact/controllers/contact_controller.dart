import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../class/contact_card.dart';
import '../class/lists.dart';

class ContactController extends GetxController {
  final totalContact = 28.obs;
  final searchController = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  final contactCardList = <ContactCards>[
    ContactCards(
        contacts: bigContactList,
        iconPath: "assets/images/contact/1.png",
        header: "All Contacts"),
    ContactCards(
        contacts: smallContactList,
        iconPath: "assets/images/contact/2.png",
        header: "Live Contacts"),
    ContactCards(
        contacts: smallContactList,
        iconPath: "assets/images/contact/3.png",
        header: "Recent Contacts"),
    ContactCards(
        contacts: bigContactList,
        iconPath: "assets/images/contact/4.png",
        header: "Work Contacts"),
  ].obs;
}
