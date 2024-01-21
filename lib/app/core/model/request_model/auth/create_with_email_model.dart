import 'dart:convert';

CreateWithEmailModel createWithEmailModelFromJson(String str) =>
    CreateWithEmailModel.fromJson(json.decode(str));

String createWithEmailModelToJson(CreateWithEmailModel data) =>
    json.encode(data.toJson());

class CreateWithEmailModel {
  String? name;
  String? username;
  String? androidToken;
  String? password;
  int? socialLoginId;

  CreateWithEmailModel({
    this.name,
    this.username,
    this.androidToken,
    this.password,
    this.socialLoginId,
  });

  factory CreateWithEmailModel.fromJson(Map<String, dynamic> json) =>
      CreateWithEmailModel(
        name: json["name"],
        username: json["username"],
        androidToken: json["androidToken"],
        password: json["password"],
        socialLoginId: json["socialLoginId"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "username": username,
        "androidToken": androidToken,
        "password": password,
        "socialLoginId": socialLoginId,
      };
}
