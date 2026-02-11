class Bus {
  final int id;
  final int vendorId;
  final String busNumber;
  final String model;
  final int capacity;
  final String status;
  final DateTime? createdAt;

  Bus({
    required this.id,
    required this.vendorId,
    required this.busNumber,
    required this.model,
    required this.capacity,
    required this.status,
    this.createdAt,
  });

  factory Bus.fromJson(Map<String, dynamic> json) {
    return Bus(
      id: json['id'] ?? 0,
      vendorId: json['vendor_id'] ?? 0,
      busNumber: json['bus_number'] ?? '',
      model: json['model'] ?? '',
      capacity: json['capacity'] ?? 0,
      status: json['status'] ?? 'active',
      createdAt: json['created_at'] != null 
          ? DateTime.parse(json['created_at']) 
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'vendor_id': vendorId,
      'bus_number': busNumber,
      'model': model,
      'capacity': capacity,
      'status': status,
      'created_at': createdAt?.toIso8601String(),
    };
  }
}
