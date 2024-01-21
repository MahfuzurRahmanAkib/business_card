import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class StartController extends GetxController {

  void goToLogin() => Get.toNamed(Routes.LOGIN);

  void goToCreate() => Get.toNamed(Routes.CREATE);
}
