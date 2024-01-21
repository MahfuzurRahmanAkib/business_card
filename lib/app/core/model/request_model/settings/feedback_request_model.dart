import 'dart:convert';

FeedbackRequestModel feedbackRequestModelFromJson(String str) =>
    FeedbackRequestModel.fromJson(json.decode(str));

String feedbackRequestModelToJson(FeedbackRequestModel data) =>
    json.encode(data.toJson());

class FeedbackRequestModel {
  String? feedback;

  FeedbackRequestModel({
    this.feedback,
  });

  factory FeedbackRequestModel.fromJson(Map<String, dynamic> json) =>
      FeedbackRequestModel(
        feedback: json["feedback"],
      );

  Map<String, dynamic> toJson() => {
        "feedback": feedback,
      };
}
