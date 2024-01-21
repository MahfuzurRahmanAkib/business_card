import 'dart:convert';

ScannedCardRequestModel scannedCardRequestModelFromJson(String str) =>
    ScannedCardRequestModel.fromJson(json.decode(str));

String scannedCardRequestModelToJson(ScannedCardRequestModel data) =>
    json.encode(data.toJson());

class ScannedCardRequestModel {
  int? cardId;

  ScannedCardRequestModel({
    this.cardId,
  });

  factory ScannedCardRequestModel.fromJson(Map<String, dynamic> json) =>
      ScannedCardRequestModel(
        cardId: json["cardId"],
      );

  Map<String, dynamic> toJson() => {
        "cardId": cardId,
      };
}
