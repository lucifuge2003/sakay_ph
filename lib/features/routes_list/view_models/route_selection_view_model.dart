import 'package:flutter/material.dart';
import 'package:sakay_ph/features/routes_list/data/models/jeepney_route.dart';
import 'package:sakay_ph/features/routes_list/data/services/jeepney_routes_service.dart';
import 'package:sakay_ph/services/route_history_service.dart';

/// A [ChangeNotifier] that manages the currently selected jeepney route.
class RouteSelectionViewModel extends ChangeNotifier {
  /// Private backing field for the currently selected route.
  JeepneyRoute? _selectedRoute;

  /// Returns the currently selected jeepney route.
  JeepneyRoute? get selectedRoute => _selectedRoute;

  /// Sets the selected route using its unique ID.
  Future<void> setSelectedRoute(String? routeId) async {
    if (routeId == null || routeId.isEmpty) {
      clearSelection();
    } else {
      try {
        final routes = await JeepneyRoutesService.getRoutes();
        final route = routes.firstWhere((r) => r.id == routeId);
        selectRoute(route);
      } catch (e) {
        debugPrint(
          'Error: Route with ID "$routeId" not found. Clearing selection. Error: $e',
        );
        clearSelection();
      }
    }
  }

  /// Directly sets the selected route object and notifies listeners.
  void selectRoute(JeepneyRoute route) {
    if (_selectedRoute != route) {
      _selectedRoute = route;
      RouteHistoryService.saveRoute(route);
      notifyListeners();
    }
  }

  /// Clears the current route selection.
  void clearSelection() {
    if (_selectedRoute != null) {
      _selectedRoute = null;
      notifyListeners();
    }
  }

  /// Returns a textual description and popular drop points for a given route.
  Map<String, String> getRouteDetails(JeepneyRoute route) {
    return {
      'desc': route.description ?? '',
      'drops': route.popularDropPoints ?? '',
    };
  }

  /// ✅ NEW METHOD
  /// Returns a route by its ID from the routes service.
  Future<JeepneyRoute?> getRouteById(String routeId) async {
    try {
      final routes = await JeepneyRoutesService.getRoutes();
      return routes.firstWhere((r) => r.id == routeId);
    } catch (e) {
      debugPrint('Route with ID "$routeId" not found. Error: $e');
      return null;
    }
  }
}
