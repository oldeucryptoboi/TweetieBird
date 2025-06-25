class WildlifeRehabber {
  final String id;
  final String name;
  final String description;
  final String phone;
  final String? email;
  final String? website;
  final String address;
  final double latitude;
  final double longitude;
  final String? zipCode;
  final List<String> acceptedSpecies;
  final bool isActive;
  final String? hours;
  final double distance; // Distance from user location

  WildlifeRehabber({
    required this.id,
    required this.name,
    required this.description,
    required this.phone,
    this.email,
    this.website,
    required this.address,
    required this.latitude,
    required this.longitude,
    this.zipCode,
    required this.acceptedSpecies,
    required this.isActive,
    this.hours,
    this.distance = 0.0,
  });

  factory WildlifeRehabber.fromJson(Map<String, dynamic> json) {
    return WildlifeRehabber(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'],
      website: json['website'],
      address: json['address'] ?? '',
      latitude: (json['latitude'] ?? 0.0).toDouble(),
      longitude: (json['longitude'] ?? 0.0).toDouble(),
      zipCode: json['zipCode'],
      acceptedSpecies: List<String>.from(json['acceptedSpecies'] ?? []),
      isActive: json['isActive'] ?? true,
      hours: json['hours'],
      distance: (json['distance'] ?? 0.0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'phone': phone,
      'email': email,
      'website': website,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'zipCode': zipCode,
      'acceptedSpecies': acceptedSpecies,
      'isActive': isActive,
      'hours': hours,
      'distance': distance,
    };
  }

  bool acceptsSpecies(String species) {
    return acceptedSpecies.isEmpty ||
        acceptedSpecies.any((accepted) =>
            species.toLowerCase().contains(accepted.toLowerCase()) ||
            accepted.toLowerCase().contains(species.toLowerCase()));
  }
}
