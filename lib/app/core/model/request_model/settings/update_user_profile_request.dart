import 'dart:convert';

UpdateUserProfileRequestModel updateUserProfileRequestModelFromJson(
        String str) =>
    UpdateUserProfileRequestModel.fromJson(json.decode(str));

String updateUserProfileRequestModelToJson(
        UpdateUserProfileRequestModel data) =>
    json.encode(data.toJson());

class UpdateUserProfileRequestModel {
  String? name;
  dynamic profileImageData;

  UpdateUserProfileRequestModel({
    this.name,
    this.profileImageData,
  });

  factory UpdateUserProfileRequestModel.fromJson(Map<String, dynamic> json) =>
      UpdateUserProfileRequestModel(
        name: json["name"],
        profileImageData: json["profileImageData"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "profileImageData": profileImageData,
      };
}
