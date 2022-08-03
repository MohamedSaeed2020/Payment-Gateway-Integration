class PaymentTokenModel {
  PaymentTokenModel({
    required this.token,
  });

  String token;

  factory PaymentTokenModel.fromJson(Map<String, dynamic> json) =>
      PaymentTokenModel(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
