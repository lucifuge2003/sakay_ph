import 'package:latlong2/latlong.dart';
import 'dart:convert';
import 'jeepney_stop.dart';

class JeepneyRoute {
  final String id;
  final String name;
  final List<JeepneyStop> stops;
  final List<LatLng> polylinePoints;

  const JeepneyRoute({
    required this.id,
    required this.name,
    required this.stops,
    required this.polylinePoints,
  });

  // a factory constructor to create a JeepneyRoute from a JSON map
  factory JeepneyRoute.fromJson(Map<String, dynamic> json) {
    var stopsList = json['stops'] as List;
    List<JeepneyStop> stops = stopsList
        .map((stopJson) => JeepneyStop.fromJson(stopJson))
        .toList();

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
      stops: stops,
      polylinePoints: polylinePoints,
    );
  }

  // a method to convert a JeepneyRoute object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'stops': stops.map((stop) => stop.toJson()).toList(),
      'polylinePoints': polylinePoints.map((point) {
        return {'latitude': point.latitude, 'longitude': point.longitude};
      }).toList(),
    };
  }
}

// * id: A unique identifier for the route, which is useful for future database operations or for passing a specific route between pages.
// * name: The human-readable name of the route (e.g., "SM City Clark via Friendship").
// * stops: A list of JeepneyStop objects we just created. This gives you the specific locations where the jeepney stops.
// * polylinePoints: A list of LatLng objects. These are the coordinates that define the exact path of the route, including all the turns and curves.
