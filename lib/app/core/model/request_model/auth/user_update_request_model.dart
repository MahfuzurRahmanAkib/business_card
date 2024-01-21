import 'dart:convert';

UserUpdateRequestModel userUpdateRequestModelFromJson(String str) =>
    UserUpdateRequestModel.fromJson(json.decode(str));

String userUpdateRequestModelToJson(UserUpdateRequestModel data) =>
    json.encode(data.toJson());

class UserUpdateRequestModel {
  String? name;
  String? profileImageData;

  UserUpdateRequestModel({
    this.name,
    this.profileImageData,
  });

  factory UserUpdateRequestModel.fromJson(Map<String, dynamic> json) =>
      UserUpdateRequestModel(
        name: json["name"],
        profileImageData: json["profileImageData"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "profileImageData": profileImageData,
      };
}
