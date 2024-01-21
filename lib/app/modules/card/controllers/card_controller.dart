import 'package:business_card_api/app/core/model/request_model/cards/send_email_request_model.dart';
import 'package:business_card_api/app/core/model/response_model/get_all_card_model.dart';
import 'package:business_card_api/app/data/repository/card_repository.dart';
import 'package:business_card_api/app/data/shared_value_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../core/model/response_model/card_transfer_request_model.dart';
import '../../../core/model/response_model/user_information_response_model.dart';
import '../../../data/api_endpoints.dart';
import '../../../routes/app_pages.dart';
import '../../bottomNavBar/views/bottom_nav_bar_view.dart';
import '../../edit/class/card_style.dart';

class CardController extends GetxController {
  List<String> items = ["QR Code", "Email", "Text"];
  int current = 0;
  final currentId = 0.obs;
  final index = 0.obs;
  final cardUrl = "".obs;
  final cardColor = "".obs;

  final isLoadingPersonalInformation = true.obs;
  final isLoadingCardInformation = true.obs;

  final userName = ''.obs;
  final userEmail = ''.obs;
  final userImage = ''.obs;

  final cardInformationData = AllCardData().obs;
  final cardInformationModelList = <Model>[].obs;
  final cardInformationGeneral = General().obs;
  final getAllCardList = GetAllCardModel().obs;

  final cardThemeColorList = <CardThemeColor>[].obs;

  //Send Email Section
  final emailController = TextEditingController().obs;
  final nameController = TextEditingController().obs;
  final messageController = TextEditingController().obs;

  // transfer card email
  final transferEmailController = TextEditingController().obs;

  final RxList<CardStyleDataSet> cardStyleImages = <CardStyleDataSet>[].obs;

  // User Information
  final userInformation = UserInformationResponseModel().obs;

  final id = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getCardShape();
    initialCall();
  }

  Future<void> initialCall() async {
    await getCardInformation();
    await getUserInformation();
  }

  void goToEditView(int? id) => Get.toNamed(Routes.EDIT, arguments: id);

  void goToCreateCardView() => Get.toNamed(Routes.CREATE_CARD);

  void goToUpdateProfile() => Get.toNamed(Routes.UPDATE);

  void goToView() => Get.toNamed(Routes.VIEW);

  Color? hexStringToColor(String input) {
    String normalized = input.replaceFirst('#', '');

    if (normalized.length == 6) {
      normalized = 'FF$normalized';
    }

    if (normalized.length != 8) {
      return null;
    }

    final int? decimal = int.tryParse(normalized, radix: 16);
    return decimal == null ? null : Color(decimal);
  }

  Future<void> sendEmail(String name, String email, String message) async {
    loadValue();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${bearerToken.$}',
    };

    var url =
        Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.sendEmail);

    SendEmailRequestModel sendEmailRequestModel = SendEmailRequestModel(
        email: email,
        message: message,
        name: name,
        cardUrl: "${ApiEndPoints.baseUrl}/${cardUrl.value}");
    String requestBody = sendEmailRequestModelToJson(sendEmailRequestModel);

    http.Response response =
        await http.post(url, body: requestBody, headers: headers);

    if (response.statusCode == 200) {
      Get.off(const BottomNavBarView());
    } else {
      Get.snackbar("", 'Failed to Send Email');
    }
  }

  Future<void> transferCard(String email) async {
    loadValue();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${bearerToken.$}',
    };

    var url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.transferCard);

    CardTransferRequestModel cardTransferRequestModel =
        CardTransferRequestModel(email: email, cardId: currentId.value);
    String requestBody =
        cardTransferRequestModelToJson(cardTransferRequestModel);

    http.Response response =
        await http.post(url, body: requestBody, headers: headers);

    if (response.statusCode == 200) {
      Get.off(const BottomNavBarView());
    } else {
      Get.snackbar("", 'Failed to Transfer Card');
    }
  }

  deleteCard() async {
    loadValue();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${bearerToken.$}',
    };

    var url = Uri.parse(ApiEndPoints.baseUrl +
        ApiEndPoints.authEndPoints.deleteCard +
        currentId.value.toString());

    var response = await http.get(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      Get.snackbar("", 'Failed to delete');
    }
  }

  duplicateCard() async {
    loadValue();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${bearerToken.$}',
    };

    var url = Uri.parse(ApiEndPoints.baseUrl +
        ApiEndPoints.authEndPoints.duplicateCard +
        currentId.value.toString());

    var response = await http.get(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      Get.snackbar("", 'Failed to duplicate');
    }
  }

  Future<void> getUserInformation() async {
    isLoadingPersonalInformation.value = true;
    var details = await CardRepository.getUser();
    userInformation.value = details;
    isLoadingPersonalInformation.value = false;
  }

  Future<void> getCardInformation() async {
    cardInformationModelList.clear();
    isLoadingCardInformation.value = true;
    var details = await CardRepository.getCardDetails();
    getAllCardList.value = details;
    isLoadingCardInformation.value = false;
  }

  getCardShape() {
    cardStyleImages.addAll([
      CardStyleDataSet(imagePath: "assets/images/card_model/wave.png"),
      CardStyleDataSet(imagePath: "assets/images/card_model/modern.png"),
      CardStyleDataSet(imagePath: "assets/images/card_model/sleek.png"),
      CardStyleDataSet(imagePath: "assets/images/card_model/linear.png"),
    ]);
    cardStyleImages.refresh();
  }
}
