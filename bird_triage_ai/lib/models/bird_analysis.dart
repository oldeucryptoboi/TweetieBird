class BirdAnalysis {
  final String id;
  final String species;
  final String age;
  final String healthStatus;
  final String recommendation;
  final String explanation;
  final double confidence;
  final DateTime timestamp;
  final String? imageUrl;
  final String? userNotes;
  final Location? location;

  BirdAnalysis({
    required this.id,
    required this.species,
    required this.age,
    required this.healthStatus,
    required this.recommendation,
    required this.explanation,
    required this.confidence,
    required this.timestamp,
    this.imageUrl,
    this.userNotes,
    this.location,
  });

  factory BirdAnalysis.fromJson(Map<String, dynamic> json) {
    return BirdAnalysis(
      id: json['id'] ?? '',
      species: json['species'] ?? '',
      age: json['age'] ?? '',
      healthStatus: json['healthStatus'] ?? '',
      recommendation: json['recommendation'] ?? '',
      explanation: json['explanation'] ?? '',
      confidence: (json['confidence'] ?? 0.0).toDouble(),
      timestamp:
          DateTime.parse(json['timestamp'] ?? DateTime.now().toIso8601String()),
      imageUrl: json['imageUrl'],
      userNotes: json['userNotes'],
      location:
          json['location'] != null ? Location.fromJson(json['location']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'species': species,
      'age': age,
      'healthStatus': healthStatus,
      'recommendation': recommendation,
      'explanation': explanation,
      'confidence': confidence,
      'timestamp': timestamp.toIso8601String(),
      'imageUrl': imageUrl,
      'userNotes': userNotes,
      'location': location?.toJson(),
    };
  }

  bool get needsRescue =>
      healthStatus.toLowerCase().contains('injured') ||
      healthStatus.toLowerCase().contains('sick') ||
      healthStatus.toLowerCase().contains('dead') ||
      recommendation.toLowerCase().contains('rescue') ||
      recommendation.toLowerCase().contains('help');
}

class Location {
  final double latitude;
  final double longitude;
  final String? address;
  final String? zipCode;

  Location({
    required this.latitude,
    required this.longitude,
    this.address,
    this.zipCode,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: (json['latitude'] ?? 0.0).toDouble(),
      longitude: (json['longitude'] ?? 0.0).toDouble(),
      address: json['address'],
      zipCode: json['zipCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'zipCode': zipCode,
    };
  }
}
