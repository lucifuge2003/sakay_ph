// lib/data/models/jeepney_route.dart
import 'package:latlong2/latlong.dart';

/// A data model representing a single jeepney route.
///
/// This class holds all the essential information for a jeepney route,
/// including its unique identifier, name, and a list of geographical
/// coordinates that define its exact path.
class JeepneyRoute {
  /// A unique identifier for the route, useful for database operations
  /// or for passing route data between screens.
  final String id;

  /// The human-readable name of the route (e.g., "SM City Clark via Friendship").
  final String name;

  /// A list of [LatLng] objects that represent the geographical points
  /// of the route's path. This is used to draw the route on a map.
  final List<LatLng> polylinePoints;

  /// Creates a new [JeepneyRoute] instance.
  const JeepneyRoute({
    required this.id,
    required this.name,
    required this.polylinePoints,
  });

  /// A factory constructor to create a [JeepneyRoute] from a JSON map.
  ///
  /// This method is responsible for deserializing the JSON data. It converts
  /// the JSON list of points into a list of [LatLng] objects, ensuring the
  /// object is correctly reconstructed.
  factory JeepneyRoute.fromJson(Map<String, dynamic> json) {
    // Deserialize the list of polyline points by mapping each JSON object to a LatLng.
    var pointsList = json['polylinePoints'] as List;
    List<LatLng> polylinePoints = pointsList.map((pointJson) {
      return LatLng(
        pointJson['latitude'] as double,
        pointJson['longitude'] as double,
      );
    }).toList();

    return JeepneyRoute(
      id: json['id'] as String,
      name: json['name'] as String,
      polylinePoints: polylinePoints,
    );
  }

  /// Converts a [JeepneyRoute] object to a JSON map.
  ///
  /// This method is crucial for serialization. It converts the object's properties,
  /// including the list of [LatLng], into a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      // Serialize the list of LatLng objects into a list of maps.
      'polylinePoints': polylinePoints.map((point) {
        return {'latitude': point.latitude, 'longitude': point.longitude};
      }).toList(),
    };
  }
}
