import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  int? statusCode;
  String? status;
  String? message;
  Data? data;

  LoginResponseModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
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
  String? apiToken;
  User? user;

  Data({
    this.apiToken,
    this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        apiToken: json["apiToken"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "apiToken": apiToken,
        "user": user?.toJson(),
      };
}

class User {
  String? name;
  String? userName;
  String? imageUrl;

  User({
    this.name,
    this.userName,
    this.imageUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        userName: json["userName"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "userName": userName,
        "imageUrl": imageUrl,
      };
}
