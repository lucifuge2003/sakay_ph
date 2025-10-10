import 'package:flutter/material.dart';
import 'package:sakay_ph/features/routes_list/data/models/jeepney_route.dart';
import 'package:sakay_ph/features/routes_list/data/initial_data/initial_jeepney_routes.dart';
import 'package:sakay_ph/services/route_history_service.dart';

/// A [ChangeNotifier] that manages the currently selected jeepney route.
class RouteSelectionViewModel extends ChangeNotifier {
  /// Private backing field for the currently selected route.
  JeepneyRoute? _selectedRoute;

  /// Returns the currently selected jeepney route.
  JeepneyRoute? get selectedRoute => _selectedRoute;

  /// Sets the selected route using its unique ID.
  void setSelectedRoute(String? routeId) {
    if (routeId == null || routeId.isEmpty) {
      clearSelection();
    } else {
      try {
        final route = initialJeepneyRoutes.firstWhere((r) => r.id == routeId);
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
  /// Returns a route by its ID from the initial routes list.
  JeepneyRoute? getRouteById(String routeId) {
    try {
      return initialJeepneyRoutes.firstWhere((r) => r.id == routeId);
    } catch (e) {
      debugPrint('Route with ID "$routeId" not found. Error: $e');
      return null;
    }
  }
}
