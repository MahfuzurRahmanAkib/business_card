import 'dart:convert';

CardTransferRequestModel cardTransferRequestModelFromJson(String str) =>
    CardTransferRequestModel.fromJson(json.decode(str));

String cardTransferRequestModelToJson(CardTransferRequestModel data) =>
    json.encode(data.toJson());

class CardTransferRequestModel {
  String? email;
  int? cardId;

  CardTransferRequestModel({
    this.email,
    this.cardId,
  });

  factory CardTransferRequestModel.fromJson(Map<String, dynamic> json) =>
      CardTransferRequestModel(
        email: json["email"],
        cardId: json["cardId"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "cardId": cardId,
      };
}
