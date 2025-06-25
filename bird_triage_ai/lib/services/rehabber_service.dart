import '../models/wildlife_rehabber.dart';
import '../models/bird_analysis.dart';
import 'location_service.dart';

class RehabberService {
  // Mock data for North Carolina wildlife rehabilitators
  static final List<WildlifeRehabber> _mockRehabbers = [
    WildlifeRehabber(
      id: '1',
      name: 'Carolina Wildlife Center',
      description:
          'Licensed wildlife rehabilitation center specializing in birds and small mammals.',
      phone: '(803) 555-0123',
      email: 'info@carolinawildlife.org',
      website: 'https://carolinawildlife.org',
      address: '555 Wildlife Way, Charlotte, NC 28202',
      latitude: 35.2271,
      longitude: -80.8431,
      zipCode: '28202',
      acceptedSpecies: [
        'American Robin',
        'Northern Cardinal',
        'Blue Jay',
        'House Sparrow'
      ],
      isActive: true,
      hours: 'Mon-Fri 8AM-6PM, Sat 9AM-4PM',
    ),
    WildlifeRehabber(
      id: '2',
      name: 'Triangle Wildlife Rehabilitation',
      description:
          'Non-profit organization dedicated to rescuing and rehabilitating injured wildlife.',
      phone: '(919) 555-0456',
      email: 'help@trianglewildlife.org',
      website: 'https://trianglewildlife.org',
      address: '123 Nature Trail, Raleigh, NC 27601',
      latitude: 35.7796,
      longitude: -78.6382,
      zipCode: '27601',
      acceptedSpecies: ['All bird species'],
      isActive: true,
      hours: 'Daily 7AM-7PM',
    ),
    WildlifeRehabber(
      id: '3',
      name: 'Mountain Bird Rescue',
      description: 'Specialized in mountain bird species and raptors.',
      phone: '(828) 555-0789',
      email: 'rescue@mountainbird.org',
      website: 'https://mountainbird.org',
      address: '789 Highland Ave, Asheville, NC 28801',
      latitude: 35.5951,
      longitude: -82.5515,
      zipCode: '28801',
      acceptedSpecies: ['Hawks', 'Owls', 'Eagles', 'Vultures'],
      isActive: true,
      hours: 'Mon-Sun 8AM-8PM',
    ),
    WildlifeRehabber(
      id: '4',
      name: 'Coastal Bird Sanctuary',
      description: 'Marine and coastal bird rehabilitation center.',
      phone: '(910) 555-0321',
      email: 'sanctuary@coastalbirds.org',
      website: 'https://coastalbirds.org',
      address: '456 Ocean Blvd, Wilmington, NC 28401',
      latitude: 34.2107,
      longitude: -77.8868,
      zipCode: '28401',
      acceptedSpecies: ['Seagulls', 'Pelicans', 'Herons', 'Egrets'],
      isActive: true,
      hours: 'Daily 6AM-10PM',
    ),
  ];

  static Future<List<WildlifeRehabber>> getNearbyRehabbers(
    Location userLocation, {
    String? species,
    double maxDistance = 50.0, // 50 miles
  }) async {
    try {
      List<WildlifeRehabber> nearbyRehabbers = [];

      for (final rehabber in _mockRehabbers) {
        if (!rehabber.isActive) continue;

        // Calculate distance
        final distance = LocationService.calculateDistance(
                userLocation,
                Location(
                  latitude: rehabber.latitude,
                  longitude: rehabber.longitude,
                )) /
            1609.34; // Convert meters to miles

        // Check if within max distance
        if (distance <= maxDistance) {
          // Check if species is accepted
          if (species == null || rehabber.acceptsSpecies(species)) {
            nearbyRehabbers.add(rehabber.copyWith(distance: distance));
          }
        }
      }

      // Sort by distance
      nearbyRehabbers.sort((a, b) => a.distance.compareTo(b.distance));

      return nearbyRehabbers;
    } catch (e) {
      print('Error getting nearby rehabbers: $e');
      return [];
    }
  }

  static Future<WildlifeRehabber?> getRehabberById(String id) async {
    try {
      return _mockRehabbers.firstWhere((rehabber) => rehabber.id == id);
    } catch (e) {
      return null;
    }
  }

  static Future<List<WildlifeRehabber>> getAllRehabbers() async {
    return _mockRehabbers.where((rehabber) => rehabber.isActive).toList();
  }
}

// Extension to add copyWith method to WildlifeRehabber
extension WildlifeRehabberExtension on WildlifeRehabber {
  WildlifeRehabber copyWith({
    String? id,
    String? name,
    String? description,
    String? phone,
    String? email,
    String? website,
    String? address,
    double? latitude,
    double? longitude,
    String? zipCode,
    List<String>? acceptedSpecies,
    bool? isActive,
    String? hours,
    double? distance,
  }) {
    return WildlifeRehabber(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      website: website ?? this.website,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      zipCode: zipCode ?? this.zipCode,
      acceptedSpecies: acceptedSpecies ?? this.acceptedSpecies,
      isActive: isActive ?? this.isActive,
      hours: hours ?? this.hours,
      distance: distance ?? this.distance,
    );
  }
}
