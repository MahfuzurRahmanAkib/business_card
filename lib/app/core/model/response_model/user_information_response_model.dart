import 'dart:convert';

UserInformationResponseModel userInformationResponseModelFromJson(String str) =>
    UserInformationResponseModel.fromJson(json.decode(str));

String userInformationResponseModelToJson(UserInformationResponseModel data) =>
    json.encode(data.toJson());

class UserInformationResponseModel {
  int? statusCode;
  String? status;
  String? message;
  Data? data;

  UserInformationResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  factory UserInformationResponseModel.fromJson(Map<String, dynamic> json) =>
      UserInformationResponseModel(
        statusCode: json["statusCode"],
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  String? name;
  String? email;
  dynamic imageUrl;
  int? totalCard;
  int? totalContact;

  Data({
    this.name,
    this.email,
    this.imageUrl,
    this.totalCard,
    this.totalContact,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        email: json["email"],
        imageUrl: json["imageUrl"],
        totalCard: json["totalCard"],
        totalContact: json["totalContact"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "imageUrl": imageUrl,
        "totalCard": totalCard,
        "totalContact": totalContact,
      };
}
