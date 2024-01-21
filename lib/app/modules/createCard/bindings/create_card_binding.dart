import 'package:get/get.dart';

import '../controllers/create_card_controller.dart';

class CreateCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateCardController>(
      () => CreateCardController(),
    );
  }
}
