import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latlong2/latlong.dart';
import '../models/jeepney_route.dart';

/// Service for loading jeepney routes from the app's asset bundle.
class JeepneyRoutesService {
  // A static cache to store routes after the first load, improving performance.
  static List<JeepneyRoute>? _cachedRoutes;

  /// Loads and parses jeepney routes from the JSON asset file.
  ///
  /// This method uses a caching strategy. On the first call, it loads the data
  /// from the JSON file. On subsequent calls, it returns the cached data instantly.
  static Future<List<JeepneyRoute>> getRoutes() async {
    if (_cachedRoutes != null) {
      return _cachedRoutes!;
    }

    try {
      // This path must exactly match the path declared in your pubspec.yaml file.
      final String jsonString = await rootBundle.loadString(
        'lib/features/routes_list/assets/data/jeepney_routes.json',
      );

      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final List<dynamic> routesJson = jsonData['jeepney_routes'] ?? [];

      _cachedRoutes = routesJson.map((routeJson) {
        return _parseRouteFromJson(routeJson as Map<String, dynamic>);
      }).toList();

      return _cachedRoutes!;
    } catch (e) {
      debugPrint('Error loading or parsing jeepney routes: $e');
      // Return an empty list on failure to prevent the app from crashing.
      return [];
    }
  }

  /// Safely converts a hex color string (e.g., "0xFFFFFFFF") to a Flutter Color.
  static Color _hexToColor(String hexColor) {
    try {
      final String cleanHex = hexColor
          .replaceAll('0x', '')
          .replaceAll('0X', '');
      // Ensure the string has a valid length and add full alpha if missing.
      final String finalHex = cleanHex.length == 6 ? 'FF$cleanHex' : cleanHex;
      if (finalHex.length == 8) {
        return Color(int.parse(finalHex, radix: 16));
      }
    } catch (e) {
      debugPrint('Error parsing color: "$hexColor". Defaulting to grey.');
    }
    // Return a default color if parsing fails for any reason.
    return Colors.grey;
  }

  /// A private helper method to safely parse a single route from a JSON map.
  static JeepneyRoute _parseRouteFromJson(Map<String, dynamic> json) {
    final List<dynamic> pointsList = json['polyline_points'] as List? ?? [];

    final List<LatLng> polylinePoints = pointsList
        .map((pointArray) {
          if (pointArray is List &&
              pointArray.length >= 2 &&
              pointArray[0] is num &&
              pointArray[1] is num) {
            return LatLng(
              (pointArray[0] as num).toDouble(),
              (pointArray[1] as num).toDouble(),
            );
          }
          return null; // Invalid point format will be filtered out.
        })
        .whereType<LatLng>()
        .toList(); // This ensures only valid LatLng objects are included.

    final Color color = _hexToColor(json['color'] as String? ?? 'FFFFFFFF');

    return JeepneyRoute(
      id: json['id'] as String? ?? 'unknown_id',
      name: json['name'] as String? ?? 'Unnamed Route',
      color: color,
      startingPoint: json['starting_point'] as String? ?? 'N/A',
      description:
          json['description'] as String? ?? 'No description available.',
      popularDropPoints: json['popular_drop_points'] as String? ?? 'N/A',
      polylinePoints: polylinePoints,
    );
  }

  /// Clears the cached routes, useful for testing or forcing a reload.
  static void clearCache() {
    _cachedRoutes = null;
  }
}
