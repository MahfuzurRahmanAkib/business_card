import 'dart:convert';

ResetPasswordModel resetPasswordModelFromJson(String str) =>
    ResetPasswordModel.fromJson(json.decode(str));

String resetPasswordModelToJson(ResetPasswordModel data) =>
    json.encode(data.toJson());

class ResetPasswordModel {
  String? password;
  String? otpCode;
  String? email;

  ResetPasswordModel({
    this.password,
    this.otpCode,
    this.email,
  });

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) =>
      ResetPasswordModel(
        password: json["password"],
        otpCode: json["otpCode"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "password": password,
        "otpCode": otpCode,
        "email": email,
      };
}
