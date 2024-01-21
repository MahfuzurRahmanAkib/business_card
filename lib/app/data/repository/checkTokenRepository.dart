import 'dart:convert';

import 'package:business_card_api/app/data/api_endpoints.dart';
import 'package:http/http.dart' as http;

class CheckTokenRepository {
  Future<int> tokenValidity({String? tokenz}) async {
    var body = jsonEncode({"token": tokenz});
    var url = "/api/auth/check-token";
    var URI = Uri.parse(ApiEndPoints.baseUrl + url);

    final response = await http.post(
      URI,
      body: body,
      headers: {
        "Content-Type": "application/json",
      },
    );
    return response.statusCode;
  }
}
