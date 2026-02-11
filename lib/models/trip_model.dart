class TripModel {
  final int? id;
  final int busId;
  final int routeId;
  final int? userId;
  final String? busNumber;
  final String? routeName;
  final String? startLocation;
  final String? endLocation;
  final DateTime? startTime;
  final DateTime? endTime;
  final double? fare;
  final String status;
  final DateTime? createdAt;

  TripModel({
    this.id,
    required this.busId,
    required this.routeId,
    this.userId,
    this.busNumber,
    this.routeName,
    this.startLocation,
    this.endLocation,
    this.startTime,
    this.endTime,
    this.fare,
    this.status = 'scheduled',
    this.createdAt,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      id: json['id'],
      busId: json['bus_id'],
      routeId: json['route_id'],
      userId: json['user_id'],
      busNumber: json['bus_number'],
      routeName: json['route_name'],
      startLocation: json['start_location'],
      endLocation: json['end_location'],
      startTime: json['start_time'] != null ? DateTime.parse(json['start_time']) : null,
      endTime: json['end_time'] != null ? DateTime.parse(json['end_time']) : null,
      fare: json['fare'] != null ? double.parse(json['fare'].toString()) : null,
      status: json['status'] ?? 'scheduled',
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'bus_id': busId,
      'route_id': routeId,
      if (userId != null) 'user_id': userId,
      'status': status,
    };
  }
}
