import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:latlong2/latlong.dart';
import 'package:sakay_ph/features/routes_list/data/models/jeepney_route.dart';

/// Service class for loading jeepney routes from JSON data.
///
/// This class provides methods to load route data from either local JSON files
/// or from JSON strings, converting them into [JeepneyRoute] objects that can
/// be used throughout the application.
class JeepneyRoutesLoader {
  /// Loads jeepney routes from a JSON file in the assets folder.
  ///
  /// [assetPath] should be the path to the JSON file in the assets folder,
  /// typically something like 'assets/data/jeepney_routes.json'.
  ///
  /// Returns a [Future<List<JeepneyRoute>>] containing all the loaded routes.
  ///
  /// Throws [Exception] if the file cannot be loaded or parsed.
  static Future<List<JeepneyRoute>> loadFromAssets(String assetPath) async {
    try {
      // Load the JSON file from assets
      final String jsonString = await rootBundle.loadString(assetPath);
      return _parseJsonString(jsonString);
    } catch (e) {
      debugPrint('Error loading from assets: $e');
      throw Exception('Failed to load jeepney routes from assets: $e');
    }
  }

  /// Loads jeepney routes from a JSON string.
  ///
  /// [jsonString] should be a valid JSON string containing the route data.
  ///
  /// Returns a [Future<List<JeepneyRoute>>] containing all the parsed routes.
  ///
  /// Throws [Exception] if the JSON cannot be parsed.
  static Future<List<JeepneyRoute>> loadFromJsonString(
    String jsonString,
  ) async {
    return _parseJsonString(jsonString);
  }

  /// Converts a hex color string to a Flutter [Color] object safely.
  ///
  /// [hexColor] should be in the format '0xFFFFFFFF' or 'FFFFFFFF'.
  /// Returns a [Color] object, defaulting to white on parsing failure.
  static Color _hexToColor(String hexColor) {
    try {
      String cleanHex = hexColor.replaceAll('0x', '').replaceAll('0X', '');

      if (cleanHex.length == 6) {
        cleanHex = 'FF$cleanHex'; // Add full alpha if not present
      }

      if (cleanHex.length == 8) {
        return Color(int.parse(cleanHex, radix: 16));
      }
      // Fallback for invalid hex strings
      return const Color(0xFFFFFFFF);
    } catch (e) {
      debugPrint(
        'Error parsing color: "$hexColor". Defaulting to white. Error: $e',
      );
      return const Color(0xFFFFFFFF); // Default to white on any error
    }
  }

  /// Internal method to parse JSON string and convert to [JeepneyRoute] objects.
  ///
  /// This method is now more robust against malformed or incomplete JSON data.
  static List<JeepneyRoute> _parseJsonString(String jsonString) {
    try {
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final List<dynamic> routesJson = jsonData['jeepney_routes'] ?? [];

      return routesJson.map((routeJson) {
        // Safely parse polyline points, skipping any invalid entries
        final List<dynamic> pointsJson = routeJson['polyline_points'] ?? [];
        final List<LatLng> polylinePoints = pointsJson
            .map((point) {
              if (point is List &&
                  point.length >= 2 &&
                  point[0] is num &&
                  point[1] is num) {
                return LatLng(point[0].toDouble(), point[1].toDouble());
              }
              return null; // Invalid point format
            })
            .whereType<LatLng>()
            .toList(); // Filter out nulls

        // Safely parse other fields with default values
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
      }).toList();
    } catch (e) {
      debugPrint('Error parsing JSON string: $e');
      throw Exception('Failed to parse jeepney routes JSON: $e');
    }
  }
}

/// A fallback function to get initial routes.
///
/// It's recommended to handle loading states explicitly in the UI,
/// but this provides a simple way to load routes on app startup.
Future<List<JeepneyRoute>> getInitialJeepneyRoutes() async {
  try {
    return await JeepneyRoutesLoader.loadFromAssets(
      'assets/data/jeepney_routes.json',
    );
  } catch (e) {
    // This will print a warning in debug mode but return an empty list
    // in production, preventing a crash if the file is missing/corrupt.
    debugPrint(
      'Warning: Could not load initial jeepney routes. Returning empty list. Error: $e',
    );
    return <JeepneyRoute>[];
  }
}
