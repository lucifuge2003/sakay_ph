import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:latlong2/latlong.dart';
import '../models/jeepney_route.dart';

/// Service for loading jeepney routes from JSON file
class JeepneyRoutesService {
  static List<JeepneyRoute>? _cachedRoutes;

  /// Loads jeepney routes from the JSON file
  /// Returns cached routes if already loaded, otherwise loads from JSON
  static Future<List<JeepneyRoute>> getRoutes() async {
    if (_cachedRoutes != null) {
      return _cachedRoutes!;
    }

    try {
      final String jsonString = await rootBundle.loadString(
        'lib/features/routes_list/assets/data/jeepney_routes.json',
      );

      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final List<dynamic> routesJson = jsonData['jeepney_routes'];

      _cachedRoutes = routesJson.map((routeJson) {
        return _parseRouteFromJson(routeJson);
      }).toList();

      return _cachedRoutes!;
    } catch (e) {
      throw Exception('Failed to load jeepney routes: $e');
    }
  }

  /// Parses a single route from JSON
  /// Handles the array format for polyline points [lat, lng]
  static JeepneyRoute _parseRouteFromJson(Map<String, dynamic> json) {
    final List<dynamic> pointsList = json['polyline_points'] as List;

    // Convert array format [lat, lng] to LatLng objects
    final List<LatLng> polylinePoints = pointsList.map((pointArray) {
      if (pointArray is List && pointArray.length >= 2) {
        return LatLng(
          (pointArray[0] as num).toDouble(),
          (pointArray[1] as num).toDouble(),
        );
      }
      throw FormatException('Invalid polyline point format: $pointArray');
    }).toList();

    // Parse color from hex string
    final String colorString = json['color'] as String;
    final Color color = Color(int.parse(colorString));

    return JeepneyRoute(
      id: json['id'] as String,
      name: json['name'] as String,
      color: color,
      startingPoint: json['starting_point'] as String,
      description: json['description'] as String,
      popularDropPoints: json['popular_drop_points'] as String,
      polylinePoints: polylinePoints,
    );
  }

  /// Clears the cached routes (useful for testing or reloading)
  static void clearCache() {
    _cachedRoutes = null;
  }
}
