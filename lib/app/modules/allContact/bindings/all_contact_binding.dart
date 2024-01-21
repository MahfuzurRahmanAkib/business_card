import 'package:get/get.dart';

import '../controllers/all_contact_controller.dart';

class AllContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllContactController>(
      () => AllContactController(),
    );
  }
}
