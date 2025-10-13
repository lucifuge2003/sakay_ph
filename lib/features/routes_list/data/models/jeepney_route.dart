import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

/// data model representing a single jeepney route.
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

  double calculateETA({double averageSpeedKmh = 20.0}) {
    // Estimate travel time for the full route.
    // averageSpeedKmh defaults to typical city jeepney speed.
    if (polylinePoints.length < 2 || averageSpeedKmh <= 0) {
      return 0.0;
    }

    final Distance distance = const Distance();
    double totalMeters = 0.0;
    for (int i = 1; i < polylinePoints.length; i++) {
      totalMeters +=
          distance.as(LengthUnit.Meter, polylinePoints[i - 1], polylinePoints[i]);
    }

    final double totalKm = totalMeters / 1000.0;
    final double hours = totalKm / averageSpeedKmh;
    return hours * 60.0; // minutes
  }
}
