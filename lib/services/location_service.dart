import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import '../models/bird_analysis.dart';

class LocationService {
  static Future<Location?> getCurrentLocation() async {
    try {
      // Check permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return null;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return null;
      }

      // Get current position
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Get address from coordinates
      List<geocoding.Placemark> placemarks =
          await geocoding.placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      final placemark = placemarks.isNotEmpty ? placemarks.first : null;

      return Location(
        latitude: position.latitude,
        longitude: position.longitude,
        address: placemark != null
            ? '${placemark.street}, ${placemark.locality}, ${placemark.administrativeArea}'
            : null,
        zipCode: placemark?.postalCode,
      );
    } catch (e) {
      print('Error getting location: $e');
      return null;
    }
  }

  static Future<Location?> getLocationFromZipCode(String zipCode) async {
    try {
      List<geocoding.Location> locations =
          await geocoding.locationFromAddress(zipCode);
      if (locations.isNotEmpty) {
        final location = locations.first;
        return Location(
          latitude: location.latitude,
          longitude: location.longitude,
          zipCode: zipCode,
        );
      }
      return null;
    } catch (e) {
      print('Error getting location from zip code: $e');
      return null;
    }
  }

  static double calculateDistance(Location location1, Location location2) {
    return Geolocator.distanceBetween(
      location1.latitude,
      location1.longitude,
      location2.latitude,
      location2.longitude,
    );
  }
}
