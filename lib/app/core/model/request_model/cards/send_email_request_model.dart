import 'dart:convert';

SendEmailRequestModel sendEmailRequestModelFromJson(String str) =>
    SendEmailRequestModel.fromJson(json.decode(str));

String sendEmailRequestModelToJson(SendEmailRequestModel data) =>
    json.encode(data.toJson());

class SendEmailRequestModel {
  String? name;
  String? email;
  String? message;
  String? cardUrl;

  SendEmailRequestModel({
    this.name,
    this.email,
    this.message,
    this.cardUrl,
  });

  factory SendEmailRequestModel.fromJson(Map<String, dynamic> json) =>
      SendEmailRequestModel(
        name: json["name"],
        email: json["email"],
        message: json["message"],
        cardUrl: json["cardUrl"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "message": message,
        "cardUrl": cardUrl,
      };
}
