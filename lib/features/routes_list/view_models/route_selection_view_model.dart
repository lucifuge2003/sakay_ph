import 'package:flutter/material.dart'; // Core Flutter widgets and ChangeNotifier.
import 'package:sakay_ph/features/routes_list/data/models/jeepney_route.dart'; // The data model for a single jeepney route.
import 'package:sakay_ph/features/routes_list/data/initial_data/initial_jeepney_routes.dart'; // Import the new data file
import 'package:sakay_ph/services/route_history_service.dart'; // Import route history service

/// A [ChangeNotifier] that manages the currently selected jeepney route.
///
/// This view model is responsible for holding the state of the user's
/// selected route and notifying listeners (like the map page) when it changes.
/// This allows for a clean separation of concerns between UI and state logic.
class RouteSelectionViewModel extends ChangeNotifier {
  /// The private backing field for the currently selected route.
  JeepneyRoute? _selectedRoute;

  /// Returns the currently selected jeepney route.
  ///
  /// This getter provides read-only access to the route state.
  JeepneyRoute? get selectedRoute => _selectedRoute;

  /// Sets the selected route based on its unique ID and notifies listeners.
  ///
  /// This is the public-facing method used by UI components (like a list of
  /// routes) to trigger a route selection without needing the full object.
  void setSelectedRoute(String? routeId) {
    if (routeId == null || routeId.isEmpty) {
      clearSelection();
    } else {
      try {
        // Find the full route object from the imported list using the ID.
        final route = initialJeepneyRoutes.firstWhere((r) => r.id == routeId);
        // Once we have the object, we set the route.
        selectRoute(route);
      } catch (e) {
        // Handle the case where the route ID is not found gracefully.
        debugPrint(
          'Error: Route with ID $routeId not found in initialJeepneyRoutes. Clearing selection. Error: $e',
        );
        clearSelection();
      }
    }
  }

  /// Sets the selected route object directly and notifies all listeners.
  ///
  /// This is an internal method to update the state once a route has been
  /// successfully found or provided.
  void selectRoute(JeepneyRoute route) {
    // Only update and notify if the route is actually changing
    if (_selectedRoute != route) {
      _selectedRoute = route;
      // Save route to history
      RouteHistoryService.saveRoute(route);
      notifyListeners();
    }
  }

  /// Clears the current route selection.
  ///
  /// Sets the selected route to `null` and notifies all listening widgets
  /// to update their state, for example, by removing a route's polyline from the map.
  void clearSelection() {
    if (_selectedRoute != null) {
      _selectedRoute = null;
      notifyListeners();
    }
  }
}
