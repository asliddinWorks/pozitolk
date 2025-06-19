class PaymentModel {
  final int id;
  final double amount;
  final DateTime createdAt;
  final String status;

  PaymentModel({
    required this.id,
    required this.amount,
    required this.createdAt,
    required this.status,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      id: json['id'],
      amount: double.parse(json['amount']),
      createdAt: DateTime.parse(json['created_at']),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'amount': amount.toStringAsFixed(2),
      'created_at': createdAt.toIso8601String(),
      'status': status,
    };
  }
}
