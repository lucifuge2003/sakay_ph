import 'package:flutter/material.dart'; // Core Flutter widgets.
import 'package:provider/provider.dart'; // State management library for sharing data.
import '../features/routes_list/data/initial_data/initial_jeepney_routes.dart'; // The initial data list of jeepney routes.
import '../features/routes_list/view_models/route_selection_view_model.dart'; // The ViewModel that manages the selected route state.
import '../features/routes_list/data/models/jeepney_route.dart'; // The data model for a single jeepney route.

/// A modal bottom sheet that displays a list of available jeepney routes.
///
/// This widget allows the user to select a route from a scrollable list.
/// Upon selection, it updates the `RouteSelectionViewModel` and closes itself.
class JeepneyRoutesBottomSheet extends StatelessWidget {
  const JeepneyRoutesBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    // Use `Provider.of` to access the RouteSelectionViewModel. This widget
    // doesn't need to rebuild on changes, but its children might.
    final viewModel = Provider.of<RouteSelectionViewModel>(context);

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Color(0xFFE5D5B8),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // A simple drag handle for the bottom sheet.
          Container(
            height: 5,
            width: 40,
            decoration: BoxDecoration(
              color: Color(0xFFC8AD7E),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 16),
          // Title for the bottom sheet.
          Text(
            'Select a Jeepney Route',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: Color(0xFFC8AD7E)),
          ),
          const SizedBox(height: 16),
          // An expanded ListView to display the list of routes.
          // It uses `ListView.builder` for efficiency.
          Expanded(
            child: ListView.builder(
              itemCount: initialJeepneyRoutes.length,
              itemBuilder: (context, index) {
                final route = initialJeepneyRoutes[index];
                return _buildRouteCard(context, route, viewModel);
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Builds a card widget for a single jeepney route.
  ///
  /// This private helper method creates a tappable `ListTile` for each route
  /// in the list.
  Widget _buildRouteCard(
    BuildContext context,
    JeepneyRoute route,
    RouteSelectionViewModel viewModel,
  ) {

    // Set purple color for Holy Angel route, etc... [pa-edit po pls]
    Color cardColor = route.id == 'checkpoint-holy-loop' 
      ? const Color(0xFFB886D3)  // Purple for Holy Angel route
      : const Color(0xFFF5F0E8); // Light beige for other routes
      
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: cardColor,
      child: ListTile(
        leading: const Icon(Icons.directions_bus, color: Color(0xFFC8AD7E)),
        title: Text(
          route.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: const Text('Tap to view on map'),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // When a route is tapped, we update the view model with the route's ID.
          // This triggers a change that the map page is listening for.
          viewModel.setSelectedRoute(route.id);
          // Close the bottom sheet after selection.
          Navigator.pop(context);
        },
      ),
    );
  }
}
