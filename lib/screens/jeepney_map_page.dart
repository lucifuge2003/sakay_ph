import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:sakay_ph/features/routes_list/view_models/route_selection_view_model.dart';
import 'package:sakay_ph/features/routes_list/data/models/jeepney_route.dart';
import 'package:sakay_ph/widgets/search_bar.dart';
import 'package:sakay_ph/widgets/routes_bottom_sheet.dart';

/// A stateful widget that represents the main map page of the application.
class JeepneyMapPage extends StatefulWidget {
  const JeepneyMapPage({super.key});

  @override
  State<JeepneyMapPage> createState() => _JeepneyMapPageState();
}

/// The state class for [JeepneyMapPage].
class _JeepneyMapPageState extends State<JeepneyMapPage>
    with TickerProviderStateMixin {
  /// Controls the map's camera position and zoom.
  final MapController _mapController = MapController();

  /// Stores the previously selected route to detect changes and trigger animations.
  JeepneyRoute? _previousSelectedRoute;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Use `context.watch` to listen for changes to the selected route.
    final selectedRoute = context
        .watch<RouteSelectionViewModel>()
        .selectedRoute;

    // Only animate if a new route has been selected.
    if (selectedRoute != null && selectedRoute != _previousSelectedRoute) {
      debugPrint('Route ${selectedRoute.id} selected. FITTING MAP.');
      _fitRouteOnMap(selectedRoute.polylinePoints);
      _previousSelectedRoute = selectedRoute;
    } else if (selectedRoute == null && _previousSelectedRoute != null) {
      // If a route has been deselected (by clearing the search),
      // return to a default view.
      debugPrint('Selection cleared. MOVING TO DEFAULT.');
      _mapController.move(const LatLng(15.1353, 120.5894), 13.0);
      _previousSelectedRoute = null;
    }
  }

  /// Animates the map's camera to fit the given list of geographical points.
  void _fitRouteOnMap(List<LatLng> points) {
    if (points.isNotEmpty) {
      final bounds = LatLngBounds.fromPoints(points);
      _mapController.fitCamera(
        CameraFit.bounds(bounds: bounds, padding: const EdgeInsets.all(50)),
      );
    }
  }

  /// Displays the `JeepneyRoutesBottomSheet` as a modal bottom sheet.
  void _showRoutesBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return const JeepneyRoutesBottomSheet();
      },
    );
  }

  /// Builds the main `FlutterMap` widget with a tile layer and a polyline layer.
  Widget _buildMap(List<Polyline> polylines) {
    return FlutterMap(
      mapController: _mapController,
      options: const MapOptions(
        initialCenter: LatLng(15.1353, 120.5894),
        initialZoom: 13.0,
      ),
      children: [
        // Base grayscale map
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.sakay_ph',
          tileBuilder: (context, widget, tile) {
            return ColorFiltered(
              colorFilter: const ColorFilter.matrix(<double>[
                0.2126, 0.7152, 0.0722, 0, 0, // R
                0.2126, 0.7152, 0.0722, 0, 0, // G
                0.2126, 0.7152, 0.0722, 0, 0, // B
                0, 0, 0, 1, 0, // A
              ]),
              child: widget,
            );
          },
        ),
        // Labels layer on top
        TileLayer(
          urlTemplate:
              'https://{s}.basemaps.cartocdn.com/light_only_labels/{z}/{x}/{y}.png',
          subdomains: const ['a', 'b', 'c', 'd'],
          userAgentPackageName: 'com.example.sakay_ph',
        ),
        // A layer to draw the route's polyline on the map.
        PolylineLayer(polylines: polylines),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Correctly get the selectedRoute object directly from the view model.
    final selectedRoute = context
        .watch<RouteSelectionViewModel>()
        .selectedRoute;
    final polylines = <Polyline>[];

    // If a route is selected, create a polyline to display on the map.
    if (selectedRoute != null) {
      polylines.add(
        Polyline(
          points: selectedRoute.polylinePoints,
          color: selectedRoute.color,
          strokeWidth: 5.0,
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          // The Map
          _buildMap(polylines),

          // Positioned search bar and suggestion list, now handled by one widget
          Positioned(
            top: 50.0,
            left: 0,
            right: 0,
            // Uses the new, self-contained search widget here
            child: const Center(child: JeepneyRouteSearch()),
          ),
        ],
      ),
      // A floating action button to open the bottom sheet for route selection.
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFB89B6E),
        onPressed: () => _showRoutesBottomSheet(context),
        child: const Icon(Icons.directions_bus),
      ),
    );
  }
}
