import 'dart:convert';

CreateOtpModel createOtpModelFromJson(String str) =>
    CreateOtpModel.fromJson(json.decode(str));

String createOtpModelToJson(CreateOtpModel data) => json.encode(data.toJson());

class CreateOtpModel {
  String? name;
  String? username;
  String? email;
  String? otp;
  String? password;
  String? socialLoginId;

  CreateOtpModel({
    this.name,
    this.username,
    this.email,
    this.otp,
    this.password,
    this.socialLoginId,
  });

  factory CreateOtpModel.fromJson(Map<String, dynamic> json) => CreateOtpModel(
        name: json["name"],
        username: json["username"],
        email: json["email"],
        otp: json["otp"],
        password: json["password"],
        socialLoginId: json["socialLoginId"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "username": username,
        "email": email,
        "otp": otp,
        "password": password,
        "socialLoginId": socialLoginId,
      };
}
