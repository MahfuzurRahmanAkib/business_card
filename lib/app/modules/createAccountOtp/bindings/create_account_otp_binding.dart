import 'package:get/get.dart';

import '../controllers/create_account_otp_controller.dart';

class CreateAccountOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateAccountOtpController>(
      () => CreateAccountOtpController(),
    );
  }
}
