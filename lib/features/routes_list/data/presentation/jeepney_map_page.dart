import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
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
import 'assistant_card.dart';

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
  LatLng? _currentLocation;
  List<JeepneyRoute> _matchingRoutes = [];
  final Distance _distance = Distance();
  bool _showInstruction = true;
  String _instructionMessage = 'Tap on the map to set your start location';

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    _getCurrentLocation();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  void _showTemporaryInstruction(String message, {int durationSeconds = 3}) {
    if (!mounted) return;
    setState(() {
      _instructionMessage = message;
      _showInstruction = true;
    });

    Future.delayed(Duration(seconds: durationSeconds), () {
      if (mounted) {
        setState(() => _showInstruction = false);
      }
    });
  }

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
      desiredAccuracy: LocationAccuracy.high,
    );

    if (!mounted) return;
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
      viewModel.getRouteById(widget.routeId!).then((selectedRoute) {
        if (selectedRoute != null && selectedRoute != _previousSelectedRoute) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              _fitRouteOnMap(selectedRoute.polylinePoints);
              _previousSelectedRoute = selectedRoute;
            }
          });
        }
      });
    } else {
      final selectedRoute = viewModel.selectedRoute;
      if (selectedRoute != null && selectedRoute != _previousSelectedRoute) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            _fitRouteOnMap(selectedRoute.polylinePoints);
            _previousSelectedRoute = selectedRoute;
          }
        });
      } else if (selectedRoute == null && _previousSelectedRoute != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            _mapController.move(const LatLng(15.1353, 120.5894), 13.0);
            _previousSelectedRoute = null;
          }
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
      final bounds = LatLngBounds.fromPoints([
        _startLocation!,
        _destinationLocation!,
      ]);
      _mapController.fitCamera(
        CameraFit.bounds(bounds: bounds, padding: const EdgeInsets.all(80)),
      );
    }
  }

  void _showRoutesBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const JeepneyRoutesBottomSheet(),
    );
  }

  void _clearMarkers() {
    setState(() {
      _startLocation = null;
      _destinationLocation = null;
      _matchingRoutes = [];
      _showTemporaryInstruction('Tap on the map to set your start location');
    });
  }

  void _clearSelectedRoute() {
    context.read<RouteSelectionViewModel>().clearSelection();
    _showTemporaryInstruction(
      'Route cleared. Select a new route or tap on the map.',
    );
  }

  Future<void> _findMatchingRoutes() async {
    if (_startLocation == null || _destinationLocation == null) return;

    try {
      final List<JeepneyRoute> allRoutes =
          await JeepneyRoutesService.getRoutes();
      final matches = allRoutes.where((route) {
        return route.polylinePoints.any(
              (point) =>
                  _distance.as(LengthUnit.Meter, point, _startLocation!) < 150,
            ) &&
            route.polylinePoints.any(
              (point) =>
                  _distance.as(LengthUnit.Meter, point, _destinationLocation!) <
                  150,
            );
      }).toList();

      if (mounted) {
        setState(() {
          _matchingRoutes = matches;
        });
        if (matches.isEmpty) {
          _showTemporaryInstruction(
            'No routes found. Try new locations.',
            durationSeconds: 4,
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
        interactionOptions: const InteractionOptions(
          flags: InteractiveFlag.all,
        ),
        onTap: (tapPosition, point) {
          if (!mounted) return;
          setState(() {
            if (_startLocation == null) {
              _startLocation = point;
              _showTemporaryInstruction(
                'Start location set. Now set destination.',
              );
            } else if (_destinationLocation == null) {
              _destinationLocation = point;
              _showTemporaryInstruction('Finding routes...');
              _findMatchingRoutes();
              _fitMarkersOnMap();
            } else {
              _startLocation = point;
              _destinationLocation = null;
              _matchingRoutes = [];
              _showTemporaryInstruction(
                'Start location reset. Now set destination.',
              );
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
                0.2126,
                0.7152,
                0.0722,
                0,
                0,
                0.2126,
                0.7152,
                0.0722,
                0,
                0,
                0.2126,
                0.7152,
                0.0722,
                0,
                0,
                0,
                0,
                0,
                1,
                0,
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

  Widget _buildInfoBox(String message) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      bottom: _showInstruction ? 80.0 : -100.0,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.9,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.85),
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Text(
            message,
            style: const TextStyle(color: Colors.white, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildRoutesFoundBox() {
    return Positioned(
      bottom: 80.0,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.9,
          ),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            // ignore: deprecated_member_use
            color: Theme.of(context).primaryColor.withOpacity(0.95),
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
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
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: _matchingRoutes.map((route) {
                  // Auto-determine text color for readability
                  final bool isDark = route.color.computeLuminance() < 0.5;
                  final Color textColor = isDark ? Colors.white : Colors.black;

                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: route.color,
                      borderRadius: BorderRadius.circular(16),
                      // ignore: deprecated_member_use
                      border: Border.all(color: Colors.black.withOpacity(0.1)),
                    ),
                    child: Text(
                      route.name,
                      style: TextStyle(
                        color: textColor,
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
          polylines.add(
            Polyline(
              points: selectedRoute.polylinePoints,
              color: Colors.black,
              strokeWidth: 7.0,
            ),
          );
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
              RepaintBoundary(child: ClipRect(child: _buildMap(polylines))),
              Positioned(
                top: 50.0,
                left: 0,
                right: 0,
                child: const Center(child: JeepneyRouteSearch()),
              ),
              if (_matchingRoutes.isNotEmpty)
                _buildRoutesFoundBox()
              else
                _buildInfoBox(_instructionMessage),
              if (_startLocation != null || _destinationLocation != null)
                Positioned(
                  bottom: 115.0,
                  left: 20.0,
                  child: FloatingActionButton.small(
                    heroTag: 'clear_markers',
                    backgroundColor: Colors.red,
                    onPressed: _clearMarkers,
                    tooltip: 'Clear Markers',
                    child: const Icon(Icons.clear, color: Colors.white),
                  ),
                ),
              if (selectedRoute != null && _startLocation == null)
                Positioned(
                  bottom: 115.0,
                  left: 20.0,
                  child: FloatingActionButton.small(
                    heroTag: 'clear_route',
                    backgroundColor: Colors.red[400],
                    onPressed: _clearSelectedRoute,
                    tooltip: 'Clear Route',
                    child: const Icon(Icons.clear, color: Colors.white),
                  ),
                ),
              Positioned(
                bottom: 225.0,
                right: 17.0,
                child: FloatingActionButton.small(
                  heroTag: 'info',
                  backgroundColor: const Color(0xFFB89B6E),
                  onPressed: () => JeepneyInfoDialog.show(context),
                  tooltip: 'Instructions',
                  child: const Icon(Icons.info_outline, color: Colors.white),
                ),
              ),
              Positioned(
                bottom: 20.0,
                left: 20.0,
                child: Column(
                  children: [
                    FloatingActionButton.small(
                      heroTag: 'zoom_in',
                      backgroundColor: Colors.black54,
                      onPressed: () {
                        _mapController.move(
                          _mapController.camera.center,
                          _mapController.camera.zoom + 1,
                        );
                      },
                      child: const Icon(Icons.add, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    FloatingActionButton.small(
                      heroTag: 'zoom_out',
                      backgroundColor: Colors.black54,
                      onPressed: () {
                        _mapController.move(
                          _mapController.camera.center,
                          _mapController.camera.zoom - 1,
                        );
                      },
                      child: const Icon(Icons.remove, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: 'assistant',
                backgroundColor: Theme.of(context).primaryColor,
                child: const Icon(Icons.pets, color: Colors.black),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => const AssistantPopup(),
                  );
                },
              ),
              const SizedBox(height: 16),
              FloatingActionButton(
                heroTag: 'profile',
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
                heroTag: 'routes_list',
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
