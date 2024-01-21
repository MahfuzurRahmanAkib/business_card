import 'dart:convert';

import '../../core/model/request_model/cards/card_create_request_model.dart';
import '../../core/model/response_model/card_data_view_model.dart';
import '../api_endpoints.dart';
import '../shared_value_model.dart';

import 'package:http/http.dart' as http;

class CreateCardRepository {
  static Future<CardResponseModel> getCardDetails() async {
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

  static Future<bool> newCardCreate(
      CardCreateRequestModel cardCreateRequestModelValue) async {
    var url =
    Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.cardCreate);
    loadValue();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${bearerToken.$}',
    };

    var requestBody = cardCreateRequestModelToJson(cardCreateRequestModelValue);

    http.Response response =
    await http.post(url, body: requestBody, headers: headers);
    if (response.statusCode == 200) {
     return true;
    } else {
      throw jsonDecode(response.body)["message"] ?? "UNKNOWN ERROR";
    }
  }
}
