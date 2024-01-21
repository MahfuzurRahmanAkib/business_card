import 'dart:convert';

ChangeMailOtpRequestModel changeMailOtpRequestModelFromJson(String str) =>
    ChangeMailOtpRequestModel.fromJson(json.decode(str));

String changeMailOtpRequestModelToJson(ChangeMailOtpRequestModel data) =>
    json.encode(data.toJson());

class ChangeMailOtpRequestModel {
  String? username;
  String? otp;

  ChangeMailOtpRequestModel({
    this.username,
    this.otp,
  });

  factory ChangeMailOtpRequestModel.fromJson(Map<String, dynamic> json) =>
      ChangeMailOtpRequestModel(
        username: json["username"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "otp": otp,
      };
}
