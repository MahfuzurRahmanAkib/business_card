import 'dart:convert';

UserCreateModel userCreateModelFromJson(String str) =>
    UserCreateModel.fromJson(json.decode(str));

String userCreateModelToJson(UserCreateModel data) =>
    json.encode(data.toJson());

class UserCreateModel {
  String? username;
  String? password;
  String? confirmPassword;
  String? userType;

  UserCreateModel({
    this.username,
    this.password,
    this.confirmPassword,
    this.userType,
  });

  factory UserCreateModel.fromJson(Map<String, dynamic> json) =>
      UserCreateModel(
        username: json["username"],
        password: json["password"],
        confirmPassword: json["confirmPassword"],
        userType: json["userType"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "confirmPassword": confirmPassword,
        "userType": userType,
      };
}
