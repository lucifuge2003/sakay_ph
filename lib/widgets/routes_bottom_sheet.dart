import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:sakay_ph/features/routes_list/data/services/jeepney_routes_service.dart';
import 'package:sakay_ph/features/routes_list/view_models/route_selection_view_model.dart';
import 'package:sakay_ph/features/routes_list/data/models/jeepney_route.dart';

/// A bottom sheet that displays a list of available jeepney routes.
///
/// This widget fetches route data asynchronously and allows users to select a
/// route to view its details or see it on the map.
class JeepneyRoutesBottomSheet extends StatefulWidget {
  const JeepneyRoutesBottomSheet({super.key});

  @override
  State<JeepneyRoutesBottomSheet> createState() =>
      _JeepneyRoutesBottomSheetState();
}

class _JeepneyRoutesBottomSheetState extends State<JeepneyRoutesBottomSheet> {
  List<JeepneyRoute> _routes = [];
  bool _isLoading = true;
  final FlutterTts _flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _loadRoutes();
  }

  /// Asynchronously loads jeepney routes from the [JeepneyRoutesService].
  Future<void> _loadRoutes() async {
    try {
      final routes = await JeepneyRoutesService.getRoutes();
      if (mounted) {
        setState(() {
          _routes = routes;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to load routes: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<RouteSelectionViewModel>(
      context,
      listen: false,
    );

    return Container(
      height:
          MediaQuery.of(context).size.height *
          0.75, // Take up 75% of screen height
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Color(0xFFE5D5B8),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle for dragging the sheet
          Container(
            height: 5,
            width: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFC8AD7E),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Select a Jeepney Route',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF725C3A),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _routes.isEmpty
                ? const Center(child: Text('No routes available.'))
                : ListView.builder(
                    itemCount: _routes.length,
                    itemBuilder: (context, index) {
                      final route = _routes[index];
                      return _buildRouteCard(context, route, viewModel);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  /// Builds a card for a single jeepney route.
  Widget _buildRouteCard(
    BuildContext context,
    JeepneyRoute route,
    RouteSelectionViewModel viewModel,
  ) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: route.color.withOpacity(0.9), // Use color from the route object
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(
          Icons.directions_bus,
          color: Colors.white.withOpacity(0.8),
        ),
        title: Text(
          route.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          'From: ${route.startingPoint}',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.white,
        ),
        onTap: () {
          viewModel.setSelectedRoute(route.id);
          _showRouteDetails(context, route);
        },
      ),
    );
  }

  /// Shows a dialog with detailed information about the selected route.
  void _showRouteDetails(BuildContext context, JeepneyRoute route) {
    // Text-to-speech function
    void _speak() async {
      await _flutterTts.setLanguage("en-US");
      await _flutterTts.setSpeechRate(0.55);
      await _flutterTts.speak(
        "${route.name}. ${route.description}. Popular drop points include ${route.popularDropPoints}.",
      );
    }

    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: const Color(0xFFE5D5B8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      route.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xFF725C3A),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: _speak,
                    icon: const Icon(Icons.volume_up, color: Color(0xFF725C3A)),
                    tooltip: 'Read aloud',
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                route.description,
                style: const TextStyle(fontSize: 15, height: 1.4),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Color(0xFF725C3A),
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Popular Drop Points: ${route.popularDropPoints}",
                      style: const TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Close'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF50C878),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context); // Close dialog
                      Navigator.pop(context); // Close bottom sheet
                      // Set the selected route in the view model for the map to display
                      Provider.of<RouteSelectionViewModel>(
                        context,
                        listen: false,
                      ).setSelectedRoute(route.id);
                    },
                    icon: const Icon(Icons.map, color: Colors.white),
                    label: const Text(
                      'View on Map',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
