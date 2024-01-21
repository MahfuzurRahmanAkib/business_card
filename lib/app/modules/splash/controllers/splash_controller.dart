import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/api_endpoints.dart';
import '../../../data/repository/checkTokenRepository.dart';
import '../../../data/shared_value_model.dart';
import '../../../routes/app_pages.dart';
import '../../card/controllers/card_controller.dart';
import '../../login/controllers/login_controller.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Get.put(CardController());
    Get.put(LoginController());
    token.load();
    loadValue();

    Timer(const Duration(seconds: 3), () async {
      if (token.$.isNotEmpty) {
        if (await tokenValidity() == 200) {
          await Get.find<CardController>().getCardInformation();
          await Get.find<CardController>().getUserInformation();
          await Get.toNamed(Routes.BOTTOM_NAV_BAR);
        }
      } else {
        Get.toNamed(Routes.START);
      }
    });
    Get.put(LoginController());
    Get.lazyPut(()=>LoginController());
    super.onInit();

  }

  tokenValidity() async {
    var response = await CheckTokenRepository().tokenValidity(tokenz: token.$);
    return response.toInt();
  }

  delay() {
    loadValue();
    Timer(const Duration(seconds: 2), () {
      checkAndNavigate();
    });
  }

  void checkAndNavigate() async {

    if (token.$.isEmpty) {
      navigateToRoute(Routes.START);
    } else {
      navigateToRoute(Routes.BOTTOM_NAV_BAR);
    }
  }
}

void navigateToRoute(String route) {
  Get.toNamed(route);
}

Future<bool> validateUser() async {
  var headers = {
    'Content-Type': 'application/json',
    "Authorization": "Bearer ${token.$}"
  };
  var url =
      Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.vailidatedUser);

  http.Response response = await http.post(url, headers: headers);

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    var token = json["data"]["apiToken"];

    token.$ = token;
    loadValue();

    return true;
  } else {
    throw jsonDecode(response.body)["message"] ?? "UNKNOWN ERROR";
  }
}
