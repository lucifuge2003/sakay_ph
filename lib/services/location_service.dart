import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

/// Service to handle location-related operations
class LocationService {
  /// Get the current user location
  static Future<LatLng?> getCurrentLocation() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return null;
      }

      // Check location permissions
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
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      return LatLng(position.latitude, position.longitude);
    } catch (e) {
      return null;
    }
  }

  /// Calculate distance between two points in kilometers
  static double calculateDistance(LatLng point1, LatLng point2) {
    const Distance distance = Distance();
    return distance.as(LengthUnit.Kilometer, point1, point2);
  }

  /// Get distance from user location to route starting point
  static Future<String> getDistanceToRoute(LatLng routeStartPoint) async {
    final userLocation = await getCurrentLocation();
    
    if (userLocation == null) {
      return 'Location unavailable';
    }

    final distance = calculateDistance(userLocation, routeStartPoint);
    
    if (distance < 1.0) {
      return '${(distance * 1000).round()}m away';
    } else {
      return '${distance.toStringAsFixed(1)}km away';
    }
  }

  /// Get user's current location as a readable string
  static Future<String> getCurrentLocationString() async {
    final location = await getCurrentLocation();
    
    if (location == null) {
      return 'Location unavailable';
    }

    // You could implement reverse geocoding here to get address
    // For now, we'll return coordinates
    return '${location.latitude.toStringAsFixed(4)}, ${location.longitude.toStringAsFixed(4)}';
  }
}
