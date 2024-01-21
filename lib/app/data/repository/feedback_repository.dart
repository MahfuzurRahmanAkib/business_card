import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/model/request_model/settings/feedback_request_model.dart';
import '../api_endpoints.dart';
import '../shared_value_model.dart';

class FeedbackRepository {
  static Future<bool> createFeedback(String feedback) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${bearerToken.$}',
    };

    var url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.sendFeedback);

    FeedbackRequestModel createFeedback =
        FeedbackRequestModel(feedback: feedback);
    String requestBody = feedbackRequestModelToJson(createFeedback);

    http.Response response =
        await http.post(url, body: requestBody, headers: headers);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw jsonDecode(response.body)["message"] ?? "UNKNOWN ERROR";
    }
  }
}
