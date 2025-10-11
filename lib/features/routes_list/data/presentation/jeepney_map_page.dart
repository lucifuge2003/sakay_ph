import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart'; // For GPS location
import 'package:sakay_ph/features/routes_list/view_models/route_selection_view_model.dart';
import 'package:sakay_ph/features/routes_list/data/models/jeepney_route.dart';
import 'package:sakay_ph/widgets/search_bar.dart';
import 'package:sakay_ph/widgets/routes_bottom_sheet.dart';
import 'package:sakay_ph/utils/page_transitions.dart';
import '../../../../screens/profile_page.dart';
import '../map/route_markers.dart';
import '../../data/services/jeepney_routes_service.dart';
import '../../data/map/jeepney_info_dialog.dart';
import 'package:latlong2/latlong.dart' show Distance, LengthUnit;

class JeepneyMapPage extends StatefulWidget {
  final String? routeId;

  const JeepneyMapPage({Key? key, this.routeId}) : super(key: key);

  @override
  State<JeepneyMapPage> createState() => _JeepneyMapPageState();
}

class _JeepneyMapPageState extends State<JeepneyMapPage>
    with TickerProviderStateMixin {
  final MapController _mapController = MapController();
  JeepneyRoute? _previousSelectedRoute;

  LatLng? _startLocation;
  LatLng? _destinationLocation;
  LatLng? _currentLocation; // GPS location
  List<JeepneyRoute> _matchingRoutes = [];
  final Distance _distance = Distance();

  @override
  void initState() {
    super.initState();
    // Hide Android navbar and status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    _getCurrentLocation();
  }

  @override
  void dispose() {
    // Restore system UI on exit
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  // Get user current GPS location
  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }

    if (permission == LocationPermission.deniedForever) return;

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _currentLocation = LatLng(position.latitude, position.longitude);
    });

    _mapController.move(_currentLocation!, 15.0);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final viewModel = context.watch<RouteSelectionViewModel>();
    
    if (widget.routeId != null) {
      // Handle async route loading
      viewModel.getRouteById(widget.routeId!).then((selectedRoute) {
        if (selectedRoute != null && selectedRoute != _previousSelectedRoute) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _fitRouteOnMap(selectedRoute.polylinePoints);
            _previousSelectedRoute = selectedRoute;
          });
        }
      });
    } else {
      // Handle synchronous route selection
      final selectedRoute = viewModel.selectedRoute;
      if (selectedRoute != null && selectedRoute != _previousSelectedRoute) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _fitRouteOnMap(selectedRoute.polylinePoints);
          _previousSelectedRoute = selectedRoute;
        });
      } else if (selectedRoute == null && _previousSelectedRoute != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _mapController.move(const LatLng(15.1353, 120.5894), 13.0);
          _previousSelectedRoute = null;
        });
      }
    }
  }

  void _fitRouteOnMap(List<LatLng> points) {
    if (points.isNotEmpty) {
      final bounds = LatLngBounds.fromPoints(points);
      _mapController.fitCamera(
        CameraFit.bounds(bounds: bounds, padding: const EdgeInsets.all(50)),
      );
    }
  }

  void _fitMarkersOnMap() {
    if (_startLocation != null && _destinationLocation != null) {
      final bounds = LatLngBounds.fromPoints([_startLocation!, _destinationLocation!]);
      _mapController.fitCamera(
        CameraFit.bounds(bounds: bounds, padding: const EdgeInsets.all(80)),
      );
    }
  }

  void _showRoutesBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => const JeepneyRoutesBottomSheet(),
    );
  }

  void _clearMarkers() {
    setState(() {
      _startLocation = null;
      _destinationLocation = null;
      _matchingRoutes = [];
    });
  }

  Future<void> _findMatchingRoutes() async {
    if (_startLocation == null || _destinationLocation == null) return;

    try {
      final List<JeepneyRoute> allRoutes = await JeepneyRoutesService.getRoutes();

    final matches = allRoutes.where((route) {
      return route.polylinePoints.any((point) =>
      _distance.as(LengthUnit.Kilometer, point, _startLocation!) < 0.05) &&
          route.polylinePoints.any((point) =>
          _distance.as(LengthUnit.Kilometer, point, _destinationLocation!) < 0.05);
    }).toList();

      if (mounted) {
        setState(() {
          _matchingRoutes = matches;
        });

        if (matches.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('No jeepney routes found between these points'),
              duration: Duration(seconds: 3),
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Error finding matching routes: $e');
    }
  }

  Widget _buildMap(List<Polyline> polylines) {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        initialCenter: const LatLng(15.1353, 120.5894),
        initialZoom: 13.0,
        onTap: (tapPosition, point) {
          setState(() {
            if (_startLocation == null) {
              _startLocation = point;
            } else if (_destinationLocation == null) {
              _destinationLocation = point;
              _findMatchingRoutes();
              _fitMarkersOnMap();
            } else {
              _startLocation = point;
              _destinationLocation = null;
              _matchingRoutes = [];
            }
          });
        },
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.sakay_ph',
          tileBuilder: (context, widget, tile) {
            return ColorFiltered(
              colorFilter: const ColorFilter.matrix(<double>[
                0.2126, 0.7152, 0.0722, 0, 0,
                0.2126, 0.7152, 0.0722, 0, 0,
                0.2126, 0.7152, 0.0722, 0, 0,
                0, 0, 0, 1, 0,
              ]),
              child: widget,
            );
          },
        ),
        TileLayer(
          urlTemplate:
          'https://{s}.basemaps.cartocdn.com/light_only_labels/{z}/{x}/{y}.png',
          subdomains: const ['a', 'b', 'c', 'd'],
          userAgentPackageName: 'com.example.sakay_ph',
        ),
        PolylineLayer(polylines: polylines),
        RouteMarkers(
          startLocation: _startLocation,
          destinationLocation: _destinationLocation,
        ),
        if (_currentLocation != null)
          MarkerLayer(
            markers: [
              Marker(
                point: _currentLocation!,
                width: 40,
                height: 40,
                child: const Icon(
                  Icons.my_location,
                  color: Colors.blue,
                  size: 32,
                ),
              ),
            ],
          ),

      ],
    );
  }

  Widget _buildInstructionBox(String message) {
    return Positioned(
      bottom: 80.0,
      left: 20.0,
      right: 20.0,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          message,
          style: const TextStyle(color: Colors.white, fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildRoutesFoundBox() {
    return Positioned(
      bottom: 80.0,
      left: 20.0,
      right: 20.0,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${_matchingRoutes.length} route(s) found!',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: _matchingRoutes.map((route) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: route.color,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    route.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RouteSelectionViewModel>();
    
    return FutureBuilder<JeepneyRoute?>(
      future: widget.routeId != null 
          ? viewModel.getRouteById(widget.routeId!)
          : Future.value(viewModel.selectedRoute),
      builder: (context, snapshot) {
        final selectedRoute = snapshot.data;
        final polylines = <Polyline>[];

        if (selectedRoute != null) {
          // Add black border for better visibility
          polylines.add(
            Polyline(
              points: selectedRoute.polylinePoints,
              color: Colors.black,
              strokeWidth: 7.0,
            ),
          );
          // Add colored line on top
          polylines.add(
            Polyline(
              points: selectedRoute.polylinePoints,
              color: selectedRoute.color,
              strokeWidth: 3.0,
            ),
          );
        }

    return Scaffold(
      body: Stack(
        children: [
          _buildMap(polylines),
          Positioned(
            top: 50.0,
            left: 0,
            right: 0,
            child: const Center(child: JeepneyRouteSearch()),
          ),
          if (_startLocation == null)
            _buildInstructionBox('Tap on the map to set your start location')
          else if (_destinationLocation == null)
            _buildInstructionBox('Tap on the map to set your destination')
          else if (_matchingRoutes.isEmpty)
              _buildInstructionBox('No matching routes found. Try different locations.')
            else
              _buildRoutesFoundBox(),
          if (_startLocation != null || _destinationLocation != null)
            Positioned(
              top: 110.0,
              right: 10.0,
              child: FloatingActionButton.small(
                heroTag: 'clear_markers',
                backgroundColor: Colors.red,
                onPressed: _clearMarkers,
                tooltip: 'Clear Markers',
                child: const Icon(Icons.clear, color: Colors.white),
              ),
            ),
          Positioned(
            top: 110.0,
            left: 10.0,
            child: FloatingActionButton.small(
              heroTag: 'info',
              backgroundColor: const Color(0xFFB89B6E),
              onPressed: () => JeepneyInfoDialog.show(context),
              tooltip: 'Instructions',
              child: const Icon(Icons.info_outline, color: Colors.white),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                SlidePageRoute(
                  child: const ProfilePage(),
                  direction: SlideDirection.rightToLeft,
                  duration: const Duration(milliseconds: 350),
                ),
              );
            },
            child: const Icon(Icons.person, color: Colors.black),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            backgroundColor: const Color(0xFFB89B6E),
            onPressed: () => _showRoutesBottomSheet(context),
            child: const Icon(Icons.directions_bus),
          ),
        ],
      ),
    );
      },
    );
  }
}
