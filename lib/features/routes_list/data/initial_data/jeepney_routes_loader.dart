import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:latlong2/latlong.dart';
import 'package:sakay_ph/features/routes_list/data/models/jeepney_route.dart';

/// Service class for loading jeepney routes from JSON data.
class JeepneyRoutesLoader {
  /// Loads jeepney routes from a JSON file in the assets folder.
  static Future<List<JeepneyRoute>> loadFromAssets(String assetPath) async {
    try {
      final String jsonString = await rootBundle.loadString(assetPath);
      return _parseJsonString(jsonString);
    } catch (e) {
      debugPrint('Failed to load jeepney routes from assets: $e');
      throw Exception('Failed to load jeepney routes from assets: $e');
    }
  }

  /// Converts a hex color string to a Flutter [Color] object safely.
  static Color _hexToColor(String hexColor) {
    try {
      String cleanHex = hexColor.replaceAll('0x', '').replaceAll('0X', '');
      if (cleanHex.length == 6) {
        cleanHex = 'FF$cleanHex'; // Add full alpha if not present
      }
      if (cleanHex.length == 8) {
        return Color(int.parse(cleanHex, radix: 16));
      }
      return const Color(0xFFFFFFFF); // Default to white for invalid length
    } catch (e) {
      debugPrint('Error parsing color: "$hexColor". Defaulting to white.');
      return const Color(0xFFFFFFFF); // Default color on any parsing error
    }
  }

  /// Internal method to parse JSON string into [JeepneyRoute] objects safely.
  static List<JeepneyRoute> _parseJsonString(String jsonString) {
    try {
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final List<dynamic> routesJson = jsonData['jeepney_routes'] ?? [];

      return routesJson
          .map((routeJson) {
            // This check ensures we don't process invalid entries in the JSON array
            if (routeJson is! Map<String, dynamic>) {
              return null;
            }

            final List<dynamic> pointsJson = routeJson['polyline_points'] ?? [];
            final List<LatLng> polylinePoints = pointsJson
                .map((point) {
                  if (point is List &&
                      point.length >= 2 &&
                      point[0] is num &&
                      point[1] is num) {
                    return LatLng(point[0].toDouble(), point[1].toDouble());
                  }
                  return null;
                })
                .whereType<LatLng>()
                .toList(); // Filters out any null (invalid) points

            return JeepneyRoute(
              id: routeJson['id']?.toString() ?? 'unknown_id_${UniqueKey()}',
              name: routeJson['name']?.toString() ?? 'Unnamed Route',
              color: _hexToColor(routeJson['color']?.toString() ?? 'FFFFFFFF'),
              startingPoint: routeJson['starting_point']?.toString() ?? 'N/A',
              description:
                  routeJson['description']?.toString() ??
                  'No description available.',
              popularDropPoints:
                  routeJson['popular_drop_points']?.toString() ?? 'N/A',
              polylinePoints: polylinePoints,
            );
          })
          .whereType<JeepneyRoute>()
          .toList(); // Filters out any null route entries
    } catch (e) {
      debugPrint('Failed to parse jeepney routes JSON: $e');
      throw Exception('Failed to parse jeepney routes JSON: $e');
    }
  }
}
