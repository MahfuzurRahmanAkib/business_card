import 'package:get/get.dart';

import '../../card/controllers/card_controller.dart';

class ViewController extends GetxController {
  final cardController = Get.find<CardController>();

  @override
  void onInit() {
    super.onInit();
    cardController.getCardShape();
    cardController.getCardInformation();
  }
}
