import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/model/request_model/auth/user_update_request_model.dart';
import '../api_endpoints.dart';
import '../shared_value_model.dart';

class UpdateProfileRepository {
  static Future<bool> updateProfile(String name, String imagePath) async {
    var url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.updateProfile);

    loadValue();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${bearerToken.$}',
    };

    UserUpdateRequestModel userUpdateRequestModel =
        UserUpdateRequestModel(name: name, profileImageData: imagePath);

    var requestBody = userUpdateRequestModelToJson(userUpdateRequestModel);

    http.Response response =
        await http.post(url, body: requestBody, headers: headers);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw jsonDecode(response.body)["message"] ?? "UNKNOWN ERROR";
    }
  }
}
