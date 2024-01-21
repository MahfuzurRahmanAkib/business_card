import 'dart:convert';

ChangeMailRequestModel changeMailRequestModelFromJson(String str) =>
    ChangeMailRequestModel.fromJson(json.decode(str));

String changeMailRequestModelToJson(ChangeMailRequestModel data) =>
    json.encode(data.toJson());

class ChangeMailRequestModel {
  String? username;

  ChangeMailRequestModel({
    this.username,
  });

  factory ChangeMailRequestModel.fromJson(Map<String, dynamic> json) =>
      ChangeMailRequestModel(
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
      };
}
