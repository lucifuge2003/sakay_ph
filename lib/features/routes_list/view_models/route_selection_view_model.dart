import 'package:flutter/material.dart';
import '../data/models/jeepney_route.dart';

/// A [ChangeNotifier] that manages the currently selected jeepney route.
///
/// This view model is responsible for holding the state of the user's
/// selected route and notifying listeners (like the map page) when it changes.
class RouteSelectionViewModel extends ChangeNotifier {
  JeepneyRoute? _selectedRoute;

  /// Returns the currently selected jeepney route.
  JeepneyRoute? get selectedRoute => _selectedRoute;

  /// Sets the selected route and notifies all listeners.
  void selectRoute(JeepneyRoute route) {
    _selectedRoute = route;
    notifyListeners();
  }

  /// Clears the current route selection.
  void clearSelection() {
    _selectedRoute = null;
    notifyListeners();
  }
}
