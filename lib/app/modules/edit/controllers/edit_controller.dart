import 'dart:convert';

import 'package:business_card_api/app/modules/card/controllers/card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../../core/model/request_model/cards/card_create_request_model.dart';
import '../../../core/model/response_model/card_data_view_model.dart';
import '../../../data/api_endpoints.dart';
import '../../../data/shared_value_model.dart';
import '../../../routes/app_pages.dart';
import '../class/card_style.dart';

class EditController extends GetxController {
  List<String> items = ["General", "Display", "Fields"];
  int current = 0;
  var selectedColor = 0.obs;
  var isSelectedBox = 0.obs;

  Rx<Color?> selectedColorForGlobalColorChange = Rx<Color?>(null);

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

  final cardUpdateRequestModelValues = CardCreateRequestModel().obs;

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
  final RxString profileImagePath = "".obs;
  final RxString logoImagePath = "".obs;
  final cardConteroller = Get.find<CardController>();
  final id = 0.obs;
  final cardColor = 0.obs;

  @override
  void onInit() {
    super.onInit();
    id.value = Get.arguments;
    setCardControllerValues();
    getCardShape();
  }

  void setCardControllerValues() {
    var cardList = cardConteroller.getAllCardList.value.data?.model;

    if (cardList != null && cardList.isNotEmpty) {
      var cardData = cardList[cardConteroller.index.value];

      nameController.value.text = cardData.general?.cardName ?? "";
      firstNameController.value.text =
          cardData.general?.personal?.nameFirst ?? "";
      lastNameController.value.text =
          cardData.general?.personal?.nameLast ?? "";
      prefixController.value.text = cardData.general?.personal?.prefix ?? "";
      titleController.value.text = cardData.general?.affiliation?.title ?? "";
      departmentController.value.text =
          cardData.general?.affiliation?.department ?? "";
      companyController.value.text =
          cardData.general?.affiliation?.company ?? "";
      headlineController.value.text =
          cardData.general?.affiliation?.aboutHeadline ?? "";

      designIndex.value = cardData.display?.cardStyle?.id ?? 0;
      colorId.value = cardData.display?.cardThemeColor?.id ?? 0;
      base64LogoImage.value =
          ApiEndPoints.baseImageUrl + (cardData.display?.logoImageUrl ?? "");
      base64ProfileImage.value =
          ApiEndPoints.baseImageUrl + (cardData.display?.profileImageUrl ?? "");
    }
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

  Future<CardResponseModel> getCardDetails() async {
    var url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.getCardData);

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${bearerToken.$}',
    };

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final userInfo = cardResponseModelFromJson(response.body);
      return userInfo;
    } else {
      throw Exception('Failed to load details');
    }
  }

  Future<void> getBasicCardInformation() async {
    cardStyleList.clear();
    cardThemeColorList.clear();
    cardFieldTypeList.clear();

    var details = await getCardDetails();
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

  Future<void> updateCard(CardCreateRequestModel cardCreateRequestModel) async {
    var url = Uri.parse(ApiEndPoints.baseUrl +
        ApiEndPoints.authEndPoints.editCard +
        id.value.toString());

    loadValue();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${bearerToken.$}',
    };

    var requestBody = cardCreateRequestModelToJson(cardCreateRequestModel);

    http.Response response =
        await http.put(url, body: requestBody, headers: headers);

    if (response.statusCode == 200) {
      Get.toNamed(Routes.BOTTOM_NAV_BAR);
    } else {
      throw jsonDecode(response.body)["message"] ?? "UNKNOWN ERROR";
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
