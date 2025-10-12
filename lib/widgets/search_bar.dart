import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sakay_ph/features/routes_list/data/models/jeepney_route.dart';
import 'package:sakay_ph/features/routes_list/view_models/route_selection_view_model.dart';
import 'package:sakay_ph/features/routes_list/data/services/jeepney_routes_service.dart';

/// A comprehensive search widget that includes the input field and the
/// dynamically generated suggestion list for jeepney routes.
class JeepneyRouteSearch extends StatefulWidget {
  const JeepneyRouteSearch({super.key});

  @override
  State<JeepneyRouteSearch> createState() => _JeepneyRouteSearchState();
}

class _JeepneyRouteSearchState extends State<JeepneyRouteSearch> {
  /// Controller for the search text field.
  final TextEditingController _searchController = TextEditingController();

  /// Focus node to track when the search bar is active.
  final FocusNode _focusNode = FocusNode();

  /// Flag to prevent the search filter from running when text is set programmatically.
  bool _settingTextProgrammatically = false;

  /// The list of all available jeepney routes for searching.
  List<JeepneyRoute> _allRoutes = [];

  /// The list of routes that match the current search query.
  List<JeepneyRoute> _filteredRoutes = [];

  /// Tracks if the search bar is currently focused.
  bool _isSearchFocused = false;

  /// Stores the current search query (lowercase) for filtering.
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    // Load routes from JSON service
    _loadRoutes();

    // Listen for text changes to trigger filtering.
    _searchController.addListener(_onSearchTextChanged);

    // Listen for focus changes to control suggestion visibility.
    _focusNode.addListener(_onFocusChanged);
  }

  /// Loads jeepney routes from the JSON service
  Future<void> _loadRoutes() async {
    try {
      _allRoutes = await JeepneyRoutesService.getRoutes();
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to load routes: $e')));
      }
    }
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchTextChanged);
    _focusNode.removeListener(_onFocusChanged);
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  /// Handles text changes and triggers route filtering.
  void _onSearchTextChanged() {
    _filterRoutes(_searchController.text);
  }

  /// Handles focus changes and controls suggestion list visibility.
  void _onFocusChanged() {
    if (_focusNode.hasFocus) {
      setState(() {
        _isSearchFocused = true;
      });
    } else {
      // Delay hiding suggestions to allow tap events on web to be processed.
      Future.delayed(const Duration(milliseconds: 200), () {
        if (mounted) {
          setState(() {
            _isSearchFocused = false;
          });
        }
      });
    }
  }

  /// Filters the [_allRoutes] based on the provided [query].
  void _filterRoutes(String query) {
    // Ignore the call if the text was just set by tapping a suggestion.
    if (_settingTextProgrammatically) return;

    setState(() {
      _searchQuery = query.toLowerCase();
      if (_searchQuery.isEmpty) {
        _filteredRoutes = [];
        // Clear the selection in the ViewModel when the search field is emptied.
        context.read<RouteSelectionViewModel>().clearSelection();
      } else {
        _filteredRoutes = _allRoutes.where((route) {
          final routeIdLower = route.id.toLowerCase();
          final routeNameLower = route.name.toLowerCase();

          return routeIdLower.contains(_searchQuery) ||
              routeNameLower.contains(_searchQuery);
        }).toList();
      }
    });
  }

  /// Handles the selection of a route from the suggestion list.
  void _selectRouteFromSuggestion(JeepneyRoute route) async {
    FocusScope.of(context).unfocus();

    // 2. Set the selected route in the ViewModel FIRST. (Triggers map update)
    await context.read<RouteSelectionViewModel>().setSelectedRoute(route.id);

    // 3. Set the flag before updating the text field.
    _settingTextProgrammatically = true;

    // 4. Update the text field with the full route name.
    _searchController.text = route.name;

    // 5. Reset the flag and perform necessary local UI updates
    if (!mounted) return;
    setState(() {
      _settingTextProgrammatically = false; // Reset flag
      _filteredRoutes = []; // Hide suggestions
      _isSearchFocused = false; // Update local focus state
    });
  }

  /// Handles search submission (e.g., when the user presses Enter or done on the keyboard).
  void _handleSubmission(String value) {
    // Attempt to find a route that exactly matches the input value or use the top suggestion.
    final match = _allRoutes.firstWhere(
      (route) =>
          route.id.toLowerCase() == value.toLowerCase() ||
          route.name.toLowerCase() == value.toLowerCase(),
      // If no exact match, and suggestions are available, use the first suggestion.
      orElse: () =>
          _filteredRoutes.isNotEmpty ? _filteredRoutes.first : _allRoutes.first,
    );
    // Use the corrected select function
    _selectRouteFromSuggestion(match);
  }

  /// Builds the stylized search field.
  Widget _buildSearchField() {
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
        focusNode: _focusNode,
        onSubmitted: _handleSubmission,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          border: InputBorder.none, // Removes the default text field underline.
          suffixIcon: IconButton(
            icon: Icon(
              // Show a clear icon only when text is present.
              _searchController.text.isNotEmpty ? Icons.clear : Icons.search,
              color: const Color(0xFF6A573F),
              size: 24.0,
            ),
            onPressed: () {
              if (_searchController.text.isNotEmpty) {
                // Clear the text, which triggers _onSearchTextChanged (clearing selection).
                _searchController.clear();
                _focusNode.unfocus(); // Lose focus after clearing
              } else {
                _focusNode.requestFocus();
              }
            },
          ),
          hintText: 'Where are you headed?',
          hintStyle: const TextStyle(
            color: Color(0xFF6A573F),
            fontWeight: FontWeight.w400,
            fontSize: 17.0,
          ),
          contentPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 12.0),
        ),
        style: const TextStyle(
          color: Color(0xFF6A573F),
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
        ),
      ),
    );
  }

  /// Builds the suggestion list overlay.
  Widget _buildSuggestionsList() {
    return Container(
      width: 350.0,
      constraints: const BoxConstraints(
        maxHeight: 250,
      ), // Max height for scrollable list
      margin: const EdgeInsets.only(top: 4.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33000000),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: _filteredRoutes.length,
          itemBuilder: (context, index) {
            final route = _filteredRoutes[index];
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  dense: true,
                  title: Text(
                    route.name,
                    style: const TextStyle(
                      color: Color(0xFF6A573F),
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                    ),
                  ),
                  subtitle: Text(
                    'Route ID: ${route.id}',
                    style: const TextStyle(
                      color: Color(0xFFB89B6E),
                      fontSize: 12.0,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: Color(0xFFB89B6E),
                  ),
                  onTap: () {
                    // This is where the suggestion is selected
                    _selectRouteFromSuggestion(route);
                  },
                ),
                // Add a subtle divider between items
                if (index < _filteredRoutes.length - 1)
                  const Divider(
                    height: 1,
                    thickness: 0.5,
                    indent: 16,
                    endIndent: 16,
                    color: Color(0xFFE5D5B8),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Only show suggestions if there's a query AND the bar is focused.
    final shouldShowSuggestions =
        _filteredRoutes.isNotEmpty && _isSearchFocused;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Wrap content height
        children: [
          // 1. The main search field
          SizedBox(width: 350.0, height: 50.0, child: _buildSearchField()),

          // 2. Suggestions List
          if (shouldShowSuggestions) _buildSuggestionsList(),
        ],
      ),
    );
  }
}
