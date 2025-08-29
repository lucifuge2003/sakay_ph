import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import '../view_models/route_selection_view_model.dart';
import '../data/models/jeepney_route.dart';

class JeepneyMapPage extends StatelessWidget {
  const JeepneyMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the selected route from the provider
    final selectedRoute = context
        .watch<RouteSelectionViewModel>()
        .selectedRoute;

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedRoute?.name ?? 'Sakay.ph Map'),
        backgroundColor: const Color(0xFFE4DCCF),
      ),
      body: Stack(
        children: [
          _buildMap(selectedRoute),
          // TODO: build the bottom panel ui here bruh
        ],
      ),
    );
  }

  Widget _buildMap(JeepneyRoute? selectedRoute) {
    return FlutterMap(
      options: MapOptions(
        // center the map on Angeles City
        initialCenter: LatLng(15.4444, 120.5901),
        initialZoom: 13.0,
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
