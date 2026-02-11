// Bus Model - Represents a bus vehicle
class BusModel {
  final String id;
  final String busNumber;
  final String vendorId;
  final int totalSeats;
  final int availableSeats;
  final String type; // 'AC', 'Non-AC', 'Sleeper', etc.
  final bool isActive;

  BusModel({
    required this.id,
    required this.busNumber,
    required this.vendorId,
    required this.totalSeats,
    required this.availableSeats,
    required this.type,
    this.isActive = true,
  });

  factory BusModel.fromJson(Map<String, dynamic> json) {
    return BusModel(
      id: json['id'] ?? '',
      busNumber: json['bus_number'] ?? '',
      vendorId: json['vendor_id'] ?? '',
      totalSeats: json['total_seats'] ?? 0,
      availableSeats: json['available_seats'] ?? 0,
      type: json['type'] ?? 'Standard',
      isActive: json['is_active'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bus_number': busNumber,
      'vendor_id': vendorId,
      'total_seats': totalSeats,
      'available_seats': availableSeats,
      'type': type,
      'is_active': isActive,
    };
  }
}
