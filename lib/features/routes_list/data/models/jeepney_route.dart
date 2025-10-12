import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

/// A data model representing a single jeepney route.
class JeepneyRoute {
  final String id;
  final String name;
  final Color color;
  final String startingPoint;
  final String description;
  final String popularDropPoints;

  final List<LatLng> polylinePoints;

  JeepneyRoute({
    required this.id,
    required this.name,
    required this.color,
    required this.startingPoint,
    required this.description,
    required this.popularDropPoints,
    required this.polylinePoints,
  });

  factory JeepneyRoute.fromJson(Map<String, dynamic> json) {
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
      color: Color(json['color'] as int),
      startingPoint: json['startingPoint'] as String,
      description: json['description'] as String,
      popularDropPoints: json['popularDropPoints'] as String,
      polylinePoints: polylinePoints,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      // ignore: deprecated_member_use
      'color': color.value,
      'startingPoint': startingPoint,
      'description': description,
      'popularDropPoints': popularDropPoints,
      'polylinePoints': polylinePoints.map((point) {
        return {'latitude': point.latitude, 'longitude': point.longitude};
      }).toList(),
    };
  }
}
