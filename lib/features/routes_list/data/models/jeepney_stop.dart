import 'package:latlong2/latlong.dart';

/// A data model representing a single stop on a jeepney route.
///
/// This class encapsulates all the necessary information for a jeepney stop,
/// including its name, precise geographical location, and an optional description.
/// It also includes methods for easy conversion to and from JSON format,
/// making it easy to save and load data from local storage.
class JeepneyStop {
  /// The human-readable name of the stop (e.g., "SM City Clark Main Gate").
  final String name;

  /// The geographical coordinates of the stop, represented by a [LatLng] object.
  final LatLng location;

  /// An optional description for the stop, which can provide additional context.
  final String? description;

  /// Creates a new [JeepneyStop] instance.
  ///
  /// The [name] and [location] are required, while the [description] is
  /// optional and can be null.
  const JeepneyStop({
    required this.name,
    required this.location,
    this.description,
  });

  /// A factory constructor to create a [JeepneyStop] from a JSON map.
  ///
  /// This method is crucial for deserialization. It takes a
  /// `Map<String, dynamic>` (the standard format for JSON data in Dart) and
  /// uses it to reconstruct a new [JeepneyStop] object.
  ///
  /// It safely handles the nullable `description` field.
  factory JeepneyStop.fromJson(Map<String, dynamic> json) {
    return JeepneyStop(
      name: json['name'] as String,
      // Create a LatLng object from the stored latitude and longitude values.
      location: LatLng(json['latitude'] as double, json['longitude'] as double),
      // The `description` field is cast as a nullable String.
      description: json['description'] as String?,
    );
  }

  /// Converts a [JeepneyStop] object to a JSON map.
  ///
  /// This method is used for serialization. It takes the object's properties
  /// and returns them as a `Map<String, dynamic>`. This map can then be
  /// converted to a JSON string for storage or transmission.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      // Store the latitude and longitude from the LatLng object.
      'latitude': location.latitude,
      'longitude': location.longitude,
      'description': description,
    };
  }
}
