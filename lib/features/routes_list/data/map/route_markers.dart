import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';


class RouteMarkers extends StatelessWidget {
  final LatLng? startLocation;
  final LatLng? destinationLocation;


  const RouteMarkers({super.key, this.startLocation, this.destinationLocation});


  @override
  Widget build(BuildContext context) {
    final markers = <Marker>[];


    if (startLocation != null) {
      markers.add(_buildMarker(startLocation!, Colors.green, "Start"));
    }


    if (destinationLocation != null) {
      markers.add(
        _buildMarker(destinationLocation!, Colors.red, "Destination"),
      );
    }


    return MarkerLayer(markers: markers);
  }


  Marker _buildMarker(LatLng point, Color color, String label) {
    return Marker(
      point: point,
      width: 80,
      height: 50,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: color, width: 2),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
          const SizedBox(height: 2),
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



