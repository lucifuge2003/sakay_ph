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

  /// Converts a hex color string to a Flutter [Color] object.
  ///
  /// [hexColor] should be in the format '0xFFFFFFFF' or 'FFFFFFFF'.
  ///
  /// Returns a [Color] object.
  static Color _hexToColor(String hexColor) {
    // Remove '0x' prefix if present
    String cleanHex = hexColor.replaceAll('0x', '').replaceAll('0X', '');

    // Ensure it's 8 characters (AARRGGBB format)
    if (cleanHex.length == 6) {
      cleanHex = 'FF$cleanHex'; // Add full alpha if not present
    }

    return Color(int.parse(cleanHex, radix: 16));
  }

  /// Internal method to parse JSON string and convert to [JeepneyRoute] objects.
  ///
  /// [jsonString] is the JSON data to parse.
  ///
  /// Returns a [List<JeepneyRoute>] containing all parsed routes.
  static List<JeepneyRoute> _parseJsonString(String jsonString) {
    try {
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final List<dynamic> routesJson = jsonData['jeepney_routes'];

      return routesJson.map((routeJson) {
        // Parse polyline points from array of [lat, lng] arrays to LatLng objects
        final List<dynamic> pointsJson = routeJson['polyline_points'];
        final List<LatLng> polylinePoints = pointsJson.map((point) {
          return LatLng(point[0].toDouble(), point[1].toDouble());
        }).toList();

        return JeepneyRoute(
          id: routeJson['id'] as String,
          name: routeJson['name'] as String,
          color: _hexToColor(routeJson['color'] as String),
          startingPoint: routeJson['starting_point'] as String,
          description: routeJson['description'] as String,           
          popularDropPoints: routeJson['popular_drop_points'] as String, 
          polylinePoints: polylinePoints,
        );
      }).toList();
    } catch (e) {
      throw Exception('Failed to parse jeepney routes JSON: $e');
    }
  }
}

/// Updated initial routes - now loads from JSON
///
/// This provides a fallback method to get routes, but it's recommended
/// to use [JeepneyRoutesLoader.loadFromAssets] instead.
Future<List<JeepneyRoute>> getInitialJeepneyRoutes() async {
  // You can either load from assets or return an empty list
  // and handle loading elsewhere in your app
  try {
    return await JeepneyRoutesLoader.loadFromAssets(
      'assets/data/jeepney_routes.json',
    );
  } catch (e) {
    // Return empty list as fallback, or handle error as needed
    print('Warning: Could not load jeepney routes: $e');
    return <JeepneyRoute>[];
  }
}
