import 'package:http/http.dart' as http;

import '../../core/model/response_model/get_all_card_model.dart';
import '../../core/model/response_model/user_information_response_model.dart';
import '../api_endpoints.dart';
import '../shared_value_model.dart';

class CardRepository{
  static Future<UserInformationResponseModel> getUser() async {
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

  static  Future<GetAllCardModel> getCardDetails() async {
    var url =
    Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.getAllCard);

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${bearerToken.$}',
    };

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final cardInfo = getAllCardModelFromJson(response.body);
      return cardInfo;
    } else {
      throw Exception('Failed to load details');
    }
  }
}