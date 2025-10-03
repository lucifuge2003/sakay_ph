import 'package:flutter/material.dart'; // Core Flutter widgets and ChangeNotifier.
import 'package:sakay_ph/features/routes_list/data/models/jeepney_route.dart'; // The data model for a single jeepney route.
import 'package:sakay_ph/features/routes_list/data/initial_data/initial_jeepney_routes.dart'; // Import the new data file

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
    if (routeId == null) {
      clearSelection();
    } else {
      // Find the full route object from the imported list using the ID.
      // An exception is thrown if the ID does not correspond to an existing route.
      final route = initialJeepneyRoutes.firstWhere(
        (route) => route.id == routeId,
        orElse: () => throw Exception('Route with ID $routeId not found'),
      );
      // Once we have the object, we can call your existing selectRoute method.
      selectRoute(route);
    }
  }

  /// Sets the selected route object directly and notifies all listeners.
  ///
  /// This is an internal method to update the state once a route has been
  /// successfully found or provided.
  void selectRoute(JeepneyRoute route) {
    _selectedRoute = route;
    notifyListeners();
  }

  /// Clears the current route selection.
  ///
  /// Sets the selected route to `null` and notifies all listening widgets
  /// to update their state, for example, by removing a route's polyline from the map.
  void clearSelection() {
    _selectedRoute = null;
    notifyListeners();
  }
}
