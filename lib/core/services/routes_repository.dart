import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sakay_ph/features/routes_list/data/models/jeepney_route.dart';

/// A repository class that handles the persistence of jeepney route data.
///
/// This class acts as a single source of truth for all data-related operations,
/// abstracting away the underlying storage mechanism (in this case,
/// [SharedPreferences]). This makes the UI layer simpler and easier to maintain.
class JeepneyRoutesRepository {
  /// The key used to store and retrieve the list of routes from local storage.
  ///
  /// Using a static constant for the key helps prevent typos and makes it
  /// easier to manage the key name across the application.
  static const String _routesKey = 'jeepney_routes_data';

  /// Saves a list of [JeepneyRoute] objects to local storage.
  ///
  /// This method serializes the list of route objects into a JSON string
  /// before saving it. The serialization process relies on the `toJson()`
  /// method implemented in the [JeepneyRoute] model class.
  ///
  /// The method is asynchronous and returns a [Future] that completes once
  /// the data has been successfully saved.
  ///
  /// @param routes The list of [JeepneyRoute] objects to be saved.
  Future<void> saveRoutes(List<JeepneyRoute> routes) async {
    // Get an instance of SharedPreferences. This is an asynchronous operation.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Map each JeepneyRoute object to its JSON representation using the toJson() method.
    final List<Map<String, dynamic>> routesJsonList = routes
        .map((route) => route.toJson())
        .toList();

    // Encode the list of JSON maps into a single JSON string.
    final String routesJsonString = json.encode(routesJsonList);

    // Save the JSON string to local storage using the predefined key.
    await prefs.setString(_routesKey, routesJsonString);
  }

  /// Loads a list of [JeepneyRoute] objects from local storage.
  ///
  /// This method retrieves the JSON string from storage, decodes it, and then
  /// converts each decoded JSON object back into a [JeepneyRoute] object.
  /// It returns an empty list if no data is found, which is a key part of
  /// handling the initial state of the app.
  ///
  /// The method is asynchronous and returns a [Future] that completes with
  /// the list of routes.
  ///
  /// @returns A [Future] containing a list of [JeepneyRoute] objects.
  Future<List<JeepneyRoute>> loadRoutes() async {
    // Get an instance of SharedPreferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve the JSON string from local storage using the defined key.
    // The result is nullable, so a String? type is used.
    final String? routesJsonString = prefs.getString(_routesKey);

    // If no data is found (the string is null), return an empty list immediately.
    // This prevents errors and ensures the UI can handle an empty state.
    if (routesJsonString == null) {
      return [];
    }

    // Decode the JSON string back into a list of dynamic objects.
    final List<dynamic> routesList = json.decode(routesJsonString);

    // Map each dynamic object in the list back to a JeepneyRoute object
    // using the fromJson factory constructor, then convert the result to a list.
    return routesList.map((json) => JeepneyRoute.fromJson(json)).toList();
  }
}
