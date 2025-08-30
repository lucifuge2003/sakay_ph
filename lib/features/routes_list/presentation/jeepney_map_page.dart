import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import '../view_models/route_selection_view_model.dart';
import '../data/models/jeepney_route.dart';
import '../../../widgets/search_bar.dart';

class JeepneyMapPage extends StatelessWidget {
  const JeepneyMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the selected route from the provider
    final selectedRoute = context
        .watch<
          RouteSelectionViewModel
        >() // ito yung purpose nung Provider dependency basically, really useful
        .selectedRoute;

    return Scaffold(
      body: Stack(
        children: [
          _buildMap(selectedRoute),
          // search bar stacked on top of the map
          const Positioned(
            top: 50.0,
            left: 10.0,
            right: 10.0,
            child: Center(
              child: SizedBox(
                width: 350.0,
                height: 50.0,
                child: JeepneySearchBar(),
              ),
            ),
          ),
          // TODO: build the bottom panel ui here bruh
        ],
      ),
    );
  }

  Widget _buildMap(JeepneyRoute? selectedRoute) {
    return FlutterMap(
      options: MapOptions(
        // center the map on Angeles City
        initialCenter: LatLng(15.1353, 120.5894), // somewhere sa angeles
        initialZoom: 15.0,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.sakay_ph',
        ),
        // draw the route polyline if a route is selected
        if (selectedRoute != null)
          PolylineLayer(
            polylines: [
              Polyline(
                points: selectedRoute.polylinePoints,
                color: Colors.deepOrange,
                strokeWidth: 5.0,
              ),
            ],
          ),
      ],
    );
  }
}
