import 'dart:convert';

import 'package:business_card_api/app/core/model/request_model/cards/card_create_request_model.dart';
import 'package:business_card_api/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/model/response_model/card_data_view_model.dart';
import '../../../data/repository/create_card_repository.dart';
import '../../edit/class/card_style.dart';

class CreateCardController extends GetxController {
  List<String> items = ["General", "Display", "Fields"];
  int current = 0;
  var selectedColor = 0.obs;
  var isSelectedBox = 0.obs;

  RxBool  isApiCallInProgress = false.obs;

  Rx<Color?> selectedColorForAll = Rx<Color?>(null);

  //general Section
  final nameController = TextEditingController().obs;
  final firstNameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  final prefixController = TextEditingController().obs;
  final titleController = TextEditingController().obs;
  final departmentController = TextEditingController().obs;
  final companyController = TextEditingController().obs;
  final headlineController = TextEditingController().obs;

  //filed Section
  final socialLinkController = TextEditingController().obs;
  final socialUserNameController = TextEditingController().obs;
  final fieldId = 0.obs;

  final cardCreateRequestModelValues = CardCreateRequestModel().obs;

  // api
  final userInformationData = Data().obs;

  final cardThemeColorList = <CardThemeColor>[].obs;
  final cardStyleList = <CardStyle>[].obs;
  final cardFieldTypeList = <CardFieldType>[].obs;
  final cardFieldDataList = <FieldList>[].obs;
  final cardFieldList = <FieldList>[].obs;

  final designIndex = 0.obs;
  final colorId = 0.obs;
  final RxList<CardStyleDataSet> cardStyleImages = <CardStyleDataSet>[].obs;

  List<int> imageBytes = <int>[].obs;
  final base64ProfileImage = "".obs;
  final base64LogoImage = "".obs;
  final profileImagePath = "".obs;
  final logoImagePath = "".obs;

  @override
  void onInit() {
    super.onInit();
    getCardShape();
  }

  void setSelectedColor(int index) {
    selectedColor.value = index;
  }

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

  Future<void> pickAndConvertImageForProfile(
      RxString imagePath,
      List<int> imageBytes,
      ImageSource source,
      ) async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: source);

    if (image != null) {
      imagePath.value = image.path.toString();
      imageBytes.clear();
      imageBytes.addAll(await image.readAsBytes());
      base64ProfileImage.value = base64Encode(imageBytes);
    }
  }

  Future<void> pickAndConvertImageForLogo(
      RxString imagePath,
      List<int> imageBytes,
      ImageSource source,
      ) async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: source);

    if (image != null) {
      imagePath.value = image.path.toString();
      imageBytes.clear();
      imageBytes.addAll(await image.readAsBytes());
      base64LogoImage.value = base64Encode(imageBytes);
    }
  }

  Future<void> getProfileImageFromCamera() async {
    await pickAndConvertImageForProfile(
        profileImagePath, imageBytes, ImageSource.camera);
  }

  Future<void> getProfileImageFromGallery() async {
    await pickAndConvertImageForProfile(
        profileImagePath, imageBytes, ImageSource.gallery);
  }

  Future<void> getLogoImageFromCamera() async {
    await pickAndConvertImageForLogo(
        logoImagePath, imageBytes, ImageSource.camera);
  }

  Future<void> getLogoImageFromGallery() async {
    await pickAndConvertImageForLogo(
        logoImagePath, imageBytes, ImageSource.gallery);
  }

  Future<void> getCardInformation() async {
    cardStyleList.clear();
    cardThemeColorList.clear();
    cardFieldTypeList.clear();

    var details = await CreateCardRepository.getCardDetails();
    userInformationData.value = details.data!;

    for (int i = 0; i < details.data!.cardThemeColors!.length; i++) {
      cardThemeColorList.add(details.data!.cardThemeColors![i]);
    }
    cardThemeColorList.refresh();

    for (int i = 0; i < details.data!.cardStyles!.length; i++) {
      cardStyleList.add(details.data!.cardStyles![i]);
    }
    cardStyleList.refresh();

    for (int i = 0; i < details.data!.cardFieldTypes!.length; i++) {
      cardFieldTypeList.add(CardFieldType(
          cardFieldTypeName:
          details.data!.cardFieldTypes![i].cardFieldTypeName.toString(),
          fieldList: details.data!.cardFieldTypes![i].fieldList));
    }
    cardFieldTypeList.refresh();
  }

  Future<void> newCardCreate(
      CardCreateRequestModel cardCreateRequestModelValue) async {
    bool ok =
        await CreateCardRepository.newCardCreate(cardCreateRequestModelValue);
    if (ok) {
      Get.toNamed(Routes.BOTTOM_NAV_BAR);
    } else {
      Get.snackbar("", 'Card Not Created');
    }
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
