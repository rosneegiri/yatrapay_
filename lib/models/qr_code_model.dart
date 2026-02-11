class QrCodeModel {
  final String qrData;
  final int? tripId;
  final int? userId;
  final String? busNumber;
  final String? routeName;
  final DateTime? scannedAt;
  final String? status;

  QrCodeModel({
    required this.qrData,
    this.tripId,
    this.userId,
    this.busNumber,
    this.routeName,
    this.scannedAt,
    this.status,
  });

  factory QrCodeModel.fromJson(Map<String, dynamic> json) {
    return QrCodeModel(
      qrData: json['qr_data'],
      tripId: json['trip_id'],
      userId: json['user_id'],
      busNumber: json['bus_number'],
      routeName: json['route_name'],
      scannedAt: json['scanned_at'] != null ? DateTime.parse(json['scanned_at']) : null,
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'qr_data': qrData,
      if (tripId != null) 'trip_id': tripId,
      if (userId != null) 'user_id': userId,
    };
  }
}
