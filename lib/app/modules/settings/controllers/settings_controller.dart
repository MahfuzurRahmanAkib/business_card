import 'package:get/get.dart';

import '../../../core/model/response_model/user_information_response_model.dart';
import '../../../routes/app_pages.dart';

class SettingsController extends GetxController {
  final RxInt activeIndex = 0.obs;
  final userInformation = UserInformationResponseModel().obs;

  void setActiveIndex(int index) {
    activeIndex.value = index;
  }

  final List<String> heading = [
    "Customize your Business Cards",
    "Customize your Business Cards",
    "Customize your Business Cards",
  ].obs;

  final List<String> details = [
    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form.",
    "There are many variations of passages of Lorem Ipsum available, or randomized words.",
    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humor, or randomized words.",
  ].obs;

  void goToFeedback() => Get.toNamed(Routes.FEEDBACK);

  void goToDetails() => Get.toNamed(Routes.ACTDETAILS);
}
