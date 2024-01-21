import 'dart:convert';

GetAllCardModel getAllCardModelFromJson(String str) =>
    GetAllCardModel.fromJson(json.decode(str));

String getAllCardModelToJson(GetAllCardModel data) =>
    json.encode(data.toJson());

class GetAllCardModel {
  int? statusCode;
  String? status;
  String? message;
  AllCardData? data;

  GetAllCardModel({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  factory GetAllCardModel.fromJson(Map<String, dynamic> json) =>
      GetAllCardModel(
        statusCode: json["statusCode"],
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : AllCardData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class AllCardData {
  List<Model>? model;
  int? totalPages;
  int? currentPage;
  int? totalElements;

  AllCardData({
    this.model,
    this.totalPages,
    this.currentPage,
    this.totalElements,
  });

  factory AllCardData.fromJson(Map<String, dynamic> json) => AllCardData(
        model: json["model"] == null
            ? []
            : List<Model>.from(json["model"]!.map((x) => Model.fromJson(x))),
        totalPages: json["totalPages"],
        currentPage: json["currentPage"],
        totalElements: json["totalElements"],
      );

  Map<String, dynamic> toJson() => {
        "model": model == null
            ? []
            : List<dynamic>.from(model!.map((x) => x.toJson())),
        "totalPages": totalPages,
        "currentPage": currentPage,
        "totalElements": totalElements,
      };
}

class Model {
  int? id;
  dynamic parentCardId;
  String? cardUrl;
  dynamic qrLogo;
  String? note;
  String? cardType;
  General? general;
  Display? display;
  List<dynamic>? userCardFields;

  Model({
    this.id,
    this.parentCardId,
    this.cardUrl,
    this.qrLogo,
    this.note,
    this.cardType,
    this.general,
    this.display,
    this.userCardFields,
  });

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        id: json["id"],
        parentCardId: json["parentCardId"],
        cardUrl: json["cardUrl"],
        qrLogo: json["qrLogo"],
        note: json["note"],
        cardType: json["cardType"],
        general:
            json["general"] == null ? null : General.fromJson(json["general"]),
        display:
            json["display"] == null ? null : Display.fromJson(json["display"]),
        userCardFields: json["userCardFields"] == null
            ? []
            : List<dynamic>.from(json["userCardFields"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parentCardId": parentCardId,
        "cardUrl": cardUrl,
        "qrLogo": qrLogo,
        "note": note,
        "cardType": cardType,
        "general": general?.toJson(),
        "display": display?.toJson(),
        "userCardFields": userCardFields == null
            ? []
            : List<dynamic>.from(userCardFields!.map((x) => x)),
      };
}

class Display {
  int? id;
  String? profileImageUrl;
  dynamic logoImageUrl;
  dynamic badgesImageUrl;
  CardStyle? cardStyle;
  CardThemeColor? cardThemeColor;

  Display({
    this.id,
    this.profileImageUrl,
    this.logoImageUrl,
    this.badgesImageUrl,
    this.cardStyle,
    this.cardThemeColor,
  });

  factory Display.fromJson(Map<String, dynamic> json) => Display(
        id: json["id"],
        profileImageUrl: json["profileImageUrl"],
        logoImageUrl: json["logoImageUrl"],
        badgesImageUrl: json["badgesImageUrl"],
        cardStyle: json["cardStyle"] == null
            ? null
            : CardStyle.fromJson(json["cardStyle"]),
        cardThemeColor: json["cardThemeColor"] == null
            ? null
            : CardThemeColor.fromJson(json["cardThemeColor"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "profileImageUrl": profileImageUrl,
        "logoImageUrl": logoImageUrl,
        "badgesImageUrl": badgesImageUrl,
        "cardStyle": cardStyle?.toJson(),
        "cardThemeColor": cardThemeColor?.toJson(),
      };
}

class CardStyle {
  int? id;
  bool? isFree;
  String? name;
  String? imageUrl;

  CardStyle({
    this.id,
    this.isFree,
    this.name,
    this.imageUrl,
  });

  factory CardStyle.fromJson(Map<String, dynamic> json) => CardStyle(
        id: json["id"],
        isFree: json["isFree"],
        name: json["name"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isFree": isFree,
        "name": name,
        "imageUrl": imageUrl,
      };
}

class CardThemeColor {
  int? id;
  String? primaryAccent;
  String? primaryColor;
  String? secondaryColor;
  String? secondaryAccent;

  CardThemeColor({
    this.id,
    this.primaryAccent,
    this.primaryColor,
    this.secondaryColor,
    this.secondaryAccent,
  });

  factory CardThemeColor.fromJson(Map<String, dynamic> json) => CardThemeColor(
        id: json["id"],
        primaryAccent: json["primaryAccent"],
        primaryColor: json["primaryColor"],
        secondaryColor: json["secondaryColor"],
        secondaryAccent: json["secondaryAccent"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "primaryAccent": primaryAccent,
        "primaryColor": primaryColor,
        "secondaryColor": secondaryColor,
        "secondaryAccent": secondaryAccent,
      };
}

class General {
  String? cardName;
  Personal? personal;
  Affiliation? affiliation;

  General({
    this.cardName,
    this.personal,
    this.affiliation,
  });

  factory General.fromJson(Map<String, dynamic> json) => General(
        cardName: json["cardName"],
        personal: json["personal"] == null
            ? null
            : Personal.fromJson(json["personal"]),
        affiliation: json["affiliation"] == null
            ? null
            : Affiliation.fromJson(json["affiliation"]),
      );

  Map<String, dynamic> toJson() => {
        "cardName": cardName,
        "personal": personal?.toJson(),
        "affiliation": affiliation?.toJson(),
      };
}

class Affiliation {
  String? title;
  String? department;
  String? company;
  String? aboutHeadline;

  Affiliation({
    this.title,
    this.department,
    this.company,
    this.aboutHeadline,
  });

  factory Affiliation.fromJson(Map<String, dynamic> json) => Affiliation(
        title: json["title"],
        department: json["department"],
        company: json["company"],
        aboutHeadline: json["aboutHeadline"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "department": department,
        "company": company,
        "aboutHeadline": aboutHeadline,
      };
}

class Personal {
  dynamic prefix;
  String? nameFirst;
  String? nameMiddle;
  String? nameLast;
  String? suffix;

  Personal({
    this.prefix,
    this.nameFirst,
    this.nameMiddle,
    this.nameLast,
    this.suffix,
  });

  factory Personal.fromJson(Map<String, dynamic> json) => Personal(
        prefix: json["prefix"],
        nameFirst: json["nameFirst"],
        nameMiddle: json["nameMiddle"],
        nameLast: json["nameLast"],
        suffix: json["suffix"],
      );

  Map<String, dynamic> toJson() => {
        "prefix": prefix,
        "nameFirst": nameFirst,
        "nameMiddle": nameMiddle,
        "nameLast": nameLast,
        "suffix": suffix,
      };
}
