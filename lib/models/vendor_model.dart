class Vendor {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String? address;
  final String status;
  final DateTime? createdAt;

  Vendor({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.address,
    required this.status,
    this.createdAt,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'],
      address: json['address'],
      status: json['status'] ?? 'active',
      createdAt: json['created_at'] != null 
          ? DateTime.parse(json['created_at']) 
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'status': status,
      'created_at': createdAt?.toIso8601String(),
    };
  }
}
