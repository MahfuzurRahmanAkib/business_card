import 'dart:convert';

import 'package:business_card_api/app/core/model/response_model/card_transfer_response_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../core/model/request_model/settings/change_mail_model.dart';
import '../../core/model/request_model/settings/change_mail_otp_model.dart';
import '../../core/model/request_model/settings/change_passord_model.dart';
import '../../core/model/response_model/user_information_response_model.dart';
import '../api_endpoints.dart';
import '../shared_value_model.dart';

class AccountDetailsRepository {
  static Future<UserInformationResponseModel> getDetails() async {
    var url =
        Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.profile);

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${bearerToken.$}',
    };

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final userInfo = userInformationResponseModelFromJson(response.body);
      return userInfo;
    } else {
      throw Exception('Failed to load details');
    }
  }

  static Future<CardTransferResponseModel> getCardTransferList() async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${bearerToken.$}',
    };

    var url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.cardTransfer);

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final acceptedCardList = cardTransferResponseModelFromJson(response.body);
      return acceptedCardList;
    } else {
      throw Exception('Failed to load cards');
    }
  }

  static Future<bool> changeEmailWithOtp(String email, String otp) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${bearerToken.$}',
    };

    var url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.changeMailWithOtp);

    ChangeMailOtpRequestModel changeMailOtpRequestModel =
        ChangeMailOtpRequestModel(username: email, otp: otp);
    String requestBody =
        changeMailOtpRequestModelToJson(changeMailOtpRequestModel);

    http.Response response =
        await http.post(url, body: requestBody, headers: headers);

    if (response.statusCode == 200) {
      print(response.statusCode.toString());
      return true;
    } else {
      throw jsonDecode(response.body)["message"] ?? "UNKNOWN ERROR";
    }
  }

  static Future<bool> changePassword(
      String oldPassword, String newPassword) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${bearerToken.$}',
    };

    var url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.changePassword);

    ChangePasswordRequestModel changePasswordRequestModel =
        ChangePasswordRequestModel(
            oldPassword: oldPassword, newPassword: newPassword);
    String requestBody =
        changePasswordRequestModelToJson(changePasswordRequestModel);

    http.Response response =
        await http.post(url, body: requestBody, headers: headers);

    if (response.statusCode == 200) {
      print(response.statusCode.toString());
      return true;
    } else {
      throw jsonDecode(response.body)["message"] ?? "UNKNOWN ERROR";
    }
  }

  static Future<bool> changeEmail(String email) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${bearerToken.$}',
    };

    var url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.changePassword);

    ChangeMailRequestModel changeMailRequestModel =
        ChangeMailRequestModel(username: email);
    String requestBody = changeMailRequestModelToJson(changeMailRequestModel);

    http.Response response =
        await http.post(url, body: requestBody, headers: headers);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw jsonDecode(response.body)["message"] ?? "UNKNOWN ERROR";
    }
  }

  static Future<bool> logout() async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${bearerToken.$}',
    };

    var url =
        Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.logout);

    var response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> deleteAccount() async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${bearerToken.$}',
    };

    var url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.deleteAccount);

    var response = await http.get(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
