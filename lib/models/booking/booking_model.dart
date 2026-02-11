// Booking Model - Represents a bus booking/trip
class BookingModel {
  final String id;
  final String userId;
  final String busId;
  final String routeId;
  final DateTime bookingDate;
  final DateTime travelDate;
  final String status; // 'pending', 'confirmed', 'cancelled', 'completed'
  final double amount;
  final String? seatNumber;
  final String? paymentId;

  BookingModel({
    required this.id,
    required this.userId,
    required this.busId,
    required this.routeId,
    required this.bookingDate,
    required this.travelDate,
    required this.status,
    required this.amount,
    this.seatNumber,
    this.paymentId,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      busId: json['bus_id'] ?? '',
      routeId: json['route_id'] ?? '',
      bookingDate: json['booking_date'] != null
          ? DateTime.parse(json['booking_date'])
          : DateTime.now(),
      travelDate: json['travel_date'] != null
          ? DateTime.parse(json['travel_date'])
          : DateTime.now(),
      status: json['status'] ?? 'pending',
      amount: (json['amount'] ?? 0).toDouble(),
      seatNumber: json['seat_number'],
      paymentId: json['payment_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'bus_id': busId,
      'route_id': routeId,
      'booking_date': bookingDate.toIso8601String(),
      'travel_date': travelDate.toIso8601String(),
      'status': status,
      'amount': amount,
      'seat_number': seatNumber,
      'payment_id': paymentId,
    };
  }
}
