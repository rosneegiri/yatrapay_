class BusRoute {
  final int id;
  final String routeName;
  final String startLocation;
  final String endLocation;
  final double distance;
  final double fare;
  final String status;
  final DateTime? createdAt;

  BusRoute({
    required this.id,
    required this.routeName,
    required this.startLocation,
    required this.endLocation,
    required this.distance,
    required this.fare,
    required this.status,
    this.createdAt,
  });

  factory BusRoute.fromJson(Map<String, dynamic> json) {
    return BusRoute(
      id: json['id'] ?? 0,
      routeName: json['route_name'] ?? '',
      startLocation: json['start_location'] ?? '',
      endLocation: json['end_location'] ?? '',
      distance: (json['distance'] ?? 0).toDouble(),
      fare: (json['fare'] ?? 0).toDouble(),
      status: json['status'] ?? 'active',
      createdAt: json['created_at'] != null 
          ? DateTime.parse(json['created_at']) 
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'route_name': routeName,
      'start_location': startLocation,
      'end_location': endLocation,
      'distance': distance,
      'fare': fare,
      'status': status,
      'created_at': createdAt?.toIso8601String(),
    };
  }
}
