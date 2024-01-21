import 'dart:convert';

ContactSaveRequestModel contactSaveRequestModelFromJson(String str) =>
    ContactSaveRequestModel.fromJson(json.decode(str));

String contactSaveRequestModelToJson(ContactSaveRequestModel data) =>
    json.encode(data.toJson());

class ContactSaveRequestModel {
  int? cardId;

  ContactSaveRequestModel({
    this.cardId,
  });

  factory ContactSaveRequestModel.fromJson(Map<String, dynamic> json) =>
      ContactSaveRequestModel(
        cardId: json["cardId"],
      );

  Map<String, dynamic> toJson() => {
        "cardId": cardId,
      };
}
