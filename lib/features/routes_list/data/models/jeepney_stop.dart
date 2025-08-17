import 'dart:convert';
import 'package:latlong2/latlong.dart';

class JeepneyStop {
  final String name;
  final LatLng location;
  final String? description;

  const JeepneyStop({
    required this.name,
    required this.location,
    this.description,
  });

  // a factory constructor to create a JeepneyStop from a JSON map
  factory JeepneyStop.fromJson(Map<String, dynamic> json) {
    return JeepneyStop(
      name: json['name'] as String,
      location: LatLng(json['latitude'] as double, json['longitude'] as double),
      description: json['description'] as String?,
    );
  }

  // a method to convert a JeepneyStop to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'latitude': location.latitude,
      'longitude': location.longitude,
      'description': description,
    };
  }
}

// * toJson(): This method takes a JeepneyStop object and converts it into a Map<String, dynamic>, which is the standard format for representing JSON data in Dart.
// * fromJson(): This is a factory constructor that takes a Map<String, dynamic> (our JSON data) and uses it to create a new JeepneyStop object.
