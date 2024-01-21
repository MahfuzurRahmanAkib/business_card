import 'dart:convert';

CardCreateRequestModel cardCreateRequestModelFromJson(String str) =>
    CardCreateRequestModel.fromJson(json.decode(str));

String cardCreateRequestModelToJson(CardCreateRequestModel data) =>
    json.encode(data.toJson());

class CardCreateRequestModel {
  dynamic parentCardId;
  String? cardType;
  bool? isScanedCard;
  String? note;
  General? general;
  Display? display;
  dynamic userCardFields;

  CardCreateRequestModel({
    this.parentCardId,
    this.cardType,
    this.isScanedCard,
    this.note,
    this.general,
    this.display,
    this.userCardFields,
  });

  factory CardCreateRequestModel.fromJson(Map<String, dynamic> json) =>
      CardCreateRequestModel(
        parentCardId: json["parentCardId"],
        cardType: json["cardType"],
        isScanedCard: json["isScanedCard"],
        general:
            json["general"] == null ? null : General.fromJson(json["general"]),
        display:
            json["display"] == null ? null : Display.fromJson(json["display"]),
        userCardFields: json["userCardFields"],
      );

  Map<String, dynamic> toJson() => {
        "parentCardId": parentCardId,
        "cardType": cardType,
        "isScanedCard": isScanedCard,
        "note": note,
        "general": general?.toJson(),
        "display": display?.toJson(),
        "userCardFields": userCardFields,
      };
}

class Display {
  dynamic profileImageData;
  dynamic logoImageData;
  dynamic badgeImageData;
  int? cardStyleId;
  int? cardThemeColorId;

  Display({
    this.profileImageData,
    this.logoImageData,
    this.badgeImageData,
    this.cardStyleId,
    this.cardThemeColorId,
  });

  factory Display.fromJson(Map<String, dynamic> json) => Display(
        profileImageData: json["profileImageData"],
        logoImageData: json["logoImageData"],
        badgeImageData: json["badgeImageData"],
        cardStyleId: json["cardStyleId"],
        cardThemeColorId: json["cardThemeColorId"],
      );

  Map<String, dynamic> toJson() => {
        "profileImageData": profileImageData,
        "logoImageData": logoImageData,
        "badgeImageData": badgeImageData,
        "cardStyleId": cardStyleId,
        "cardThemeColorId": cardThemeColorId,
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
