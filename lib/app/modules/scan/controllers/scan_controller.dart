import 'package:business_card_api/app/core/model/request_model/cards/scanned_card_req_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../core/model/response_model/qr_response_model.dart';
import '../../../data/api_endpoints.dart';
import '../../../data/shared_value_model.dart';
import '../../../routes/app_pages.dart';
import '../../bottomNavBar/views/bottom_nav_bar_view.dart';

import 'package:http/http.dart' as http;

class ScanController extends GetxController {
  Barcode? result;
  late final QRViewController? controller;

  bool isComplete = false;
  final scannedData = ''.obs;
  final cardId = 0.obs;
  final responseModel = QrResponseModel().obs;

  @override
  void dispose() {
    controller?.dispose();
    controller?.stopCamera();
    super.dispose();
  }

  Future<void> scanQrCode() async {
    String barcodeScanResponse;
    try {
      barcodeScanResponse = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      scannedData.value = barcodeScanResponse;
      await getCardFromQRCode();
      if (responseModel.value.statusCode == 200) {
        goToViewDetails();
      } else {
        Get.snackbar("", 'Failed to get card data.');
      }
    } on PlatformException {
      barcodeScanResponse = 'Failed to get Quick Response Code Data.';
      scannedData.value = barcodeScanResponse;
    }
  }

  Future<QrResponseModel> getCardFromQRCode() async {
    try {
      loadValue();
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${bearerToken.$}',
      };

      var url = Uri.parse(ApiEndPoints.baseUrl +
          ApiEndPoints.authEndPoints.getCardModelFromUrl +
          scannedData.value);

      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final qrDetailInfo = qrResponseModelFromJson(response.body);
        responseModel.value = qrDetailInfo;
        return qrDetailInfo;
      } else {
        Get.snackbar("", 'Failed to get card data.');
        throw Exception(
            "Failed to get card data. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("", '$e');
      throw Exception("Error in getCardFromQRCode: $e");
    }
  }

  Future<void> createContact(int id) async {
    loadValue();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${bearerToken.$}',
    };

    if (responseModel.value.data != null) {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.qrSaveContact);

      cardId.value = responseModel.value.data!.id!;
      ScannedCardRequestModel scannedCardRequestModel =
          ScannedCardRequestModel(cardId: cardId.value);
      String responseBody =
          scannedCardRequestModelToJson(scannedCardRequestModel);
      http.Response response =
          await http.post(url, body: responseBody, headers: headers);

      if (response.statusCode == 200) {
        Get.off(const BottomNavBarView());
        Get.snackbar("", "Contact saved");
      } else {
        Get.snackbar("", "Failed To Save Contact");
      }
    } else {
      Get.snackbar("", "Data Is Null");
    }
  }

  void goToViewDetails() => Get.toNamed(Routes.VIEW);
}
