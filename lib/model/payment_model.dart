class PaymentModel {
  String uid;
  String? payemntId;
  double amount;

  PaymentModel({required this.amount, required this.uid,this.payemntId});
  Map<String, dynamic> toJson(id) =>
      {"uid": uid, "payemntId": id, "amount": amount};
  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
        amount: json["amount"], uid: json["uid"], payemntId: json["payemntId"]);
  }
}
