import 'package:flutter/material.dart'; // Core Flutter widgets.
import 'package:provider/provider.dart'; // State management for a clean app architecture.
import 'package:sakay_ph/features/routes_list/view_models/route_selection_view_model.dart'; // The ViewModel to manage route selection state.

/// A custom search bar widget designed for the jeepney route finder.
///
/// This is a [StatefulWidget] to manage its own text input state. It
/// allows users to input a route ID to select a specific jeepney route.
class JeepneySearchBar extends StatefulWidget {
  const JeepneySearchBar({super.key});

  @override
  State<JeepneySearchBar> createState() => _JeepneySearchBarState();
}

/// The state class for [JeepneySearchBar].
///
/// Manages the `TextEditingController` and the widget's lifecycle.
class _JeepneySearchBarState extends State<JeepneySearchBar> {
  /// Controller for the text field, used to read and clear user input.
  final TextEditingController _searchController = TextEditingController();

  /// Disposes of the controller when the widget is removed from the widget tree.
  /// This prevents memory leaks.
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFE5D5B8), Color(0xFFB89B6E)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(color: Colors.black, width: 1.0),
        boxShadow: const [
          BoxShadow(
            color: Color(0x4D000000),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        onSubmitted: (routeId) {
          // Access the RouteSelectionViewModel without causing a rebuild.
          final viewModel = Provider.of<RouteSelectionViewModel>(
            context,
            listen: false,
          );
          if (routeId.isNotEmpty) {
            // If the input is not empty, set the selected route in the ViewModel.
            viewModel.setSelectedRoute(routeId);
          } else {
            // If the input is empty, clear the current route selection.
            viewModel.clearSelection();
          }
        },
        textAlignVertical: TextAlignVertical.center,
        decoration: const InputDecoration(
          border: InputBorder.none, // Removes the default text field underline.
          suffixIcon: Icon(Icons.search, color: Color(0xFF6A573F), size: 24.0),
          hintText: 'Where are you headed?',
          hintStyle: TextStyle(
            color: Color(0xFFE5D5B8),
            fontWeight: FontWeight.w400,
            fontSize: 17.0,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 16.0,
          ),
        ),
        style: const TextStyle(
          color: Color(0xFF6A573F),
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
