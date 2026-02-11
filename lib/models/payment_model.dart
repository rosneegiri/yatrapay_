class PaymentModel {
  final int? id;
  final int userId;
  final int tripId;
  final double amount;
  final String paymentMethod;
  final String status;
  final String? transactionId;
  final DateTime? paidAt;
  final DateTime? createdAt;

  PaymentModel({
    this.id,
    required this.userId,
    required this.tripId,
    required this.amount,
    required this.paymentMethod,
    this.status = 'pending',
    this.transactionId,
    this.paidAt,
    this.createdAt,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      id: json['id'],
      userId: json['user_id'],
      tripId: json['trip_id'],
      amount: double.parse(json['amount'].toString()),
      paymentMethod: json['payment_method'],
      status: json['status'] ?? 'pending',
      transactionId: json['transaction_id'],
      paidAt: json['paid_at'] != null ? DateTime.parse(json['paid_at']) : null,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'user_id': userId,
      'trip_id': tripId,
      'amount': amount,
      'payment_method': paymentMethod,
      'status': status,
      if (transactionId != null) 'transaction_id': transactionId,
    };
  }
}
