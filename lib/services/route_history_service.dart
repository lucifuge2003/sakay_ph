import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:latlong2/latlong.dart';
import 'dart:convert';
import '../features/routes_list/data/models/jeepney_route.dart';

/// Service to manage route history and saved routes
class RouteHistoryService {
  static const String _routeHistoryKey = 'route_history';
  static const int _maxHistorySize =
      10; // Maximum number of routes to keep in history

  /// Save a route to history
  static Future<void> saveRoute(JeepneyRoute route) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final List<String> historyJson =
          prefs.getStringList(_routeHistoryKey) ?? [];

      // Convert route to JSON
      final routeJson = jsonEncode({
        'id': route.id,
        'name': route.name,
        'color': route.color.value, // Store color as int value
        'startingPoint': route.startingPoint,
        'polylinePoints': route.polylinePoints
            .map(
              (point) => {
                'latitude': point.latitude,
                'longitude': point.longitude,
              },
            )
            .toList(),
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      });

      // Remove if already exists (to move to top)
      historyJson.removeWhere((item) {
        final existingRoute = jsonDecode(item);
        return existingRoute['id'] == route.id;
      });

      // Add to beginning of list
      historyJson.insert(0, routeJson);

      // Keep only the most recent routes
      if (historyJson.length > _maxHistorySize) {
        historyJson.removeRange(_maxHistorySize, historyJson.length);
      }

      await prefs.setStringList(_routeHistoryKey, historyJson);
    } catch (e) {
      debugPrint('Error saving route to history: $e');
    }
  }

  /// Get route history
  static Future<List<JeepneyRoute>> getRouteHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final List<String> historyJson =
          prefs.getStringList(_routeHistoryKey) ?? [];

      return historyJson.map((routeJson) {
        final routeData = jsonDecode(routeJson);
        return JeepneyRoute(
          id: routeData['id'],
          name: routeData['name'],
          color: Color(routeData['color']),
          startingPoint: routeData['startingPoint'],
          polylinePoints: (routeData['polylinePoints'] as List).map((point) {
            return LatLng(point['latitude'], point['longitude']);
          }).toList(),
          description: '',
          popularDropPoints: '',
        );
      }).toList();
    } catch (e) {
      debugPrint('Error loading route history: $e');
      return [];
    }
  }

  /// Clear all route history
  static Future<void> clearHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_routeHistoryKey);
    } catch (e) {
      debugPrint('Error clearing route history: $e');
    }
  }

  /// Remove a specific route from history
  static Future<void> removeRoute(String routeId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final List<String> historyJson =
          prefs.getStringList(_routeHistoryKey) ?? [];

      historyJson.removeWhere((item) {
        final routeData = jsonDecode(item);
        return routeData['id'] == routeId;
      });

      await prefs.setStringList(_routeHistoryKey, historyJson);
    } catch (e) {
      debugPrint('Error removing route from history: $e');
    }
  }

  /// Get route history with timestamps
  static Future<List<Map<String, dynamic>>>
  getRouteHistoryWithTimestamps() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final List<String> historyJson =
          prefs.getStringList(_routeHistoryKey) ?? [];

      return historyJson.map((routeJson) {
        return jsonDecode(routeJson) as Map<String, dynamic>;
      }).toList();
    } catch (e) {
      debugPrint('Error loading route history with timestamps: $e');
      return [];
    }
  }
}
