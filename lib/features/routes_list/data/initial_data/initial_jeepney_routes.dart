import 'package:flutter/widgets.dart'; // Provides the Color class for defining route colors.
import 'package:latlong2/latlong.dart'; // Provides the LatLng class for geographical coordinates.
import '../models/jeepney_route.dart'; // Imports the custom JeepneyRoute data model.

/// This file contains a predefined list of static jeepney routes.
///
/// Each route is represented by a [JeepneyRoute] object, which holds
/// all the necessary data to display the route on a map, including its
/// name, color, and geographical path. This data is hardcoded for
/// demonstration or for applications where routes are fixed.
final initialJeepneyRoutes = <JeepneyRoute>[
  /// Defines the "Checkpoint - Holy Angel University" loop route.
  /// This route is used to draw the path on the map and for identification.
  JeepneyRoute(
    id: 'checkpoint-holy-loop',
    name: 'Checkpoint - Holy Angel University',
    color: const Color(
      0xFF800080,
    ), // The color used to render the route's polyline.
    startingPoint: 'Checkpoint',

    /// The list of [LatLng] points that define the precise path of the jeepney route.
    /// A large number of points is provided to ensure the route accurately follows
    /// the real-world road network, preventing straight lines across blocks.
    polylinePoints: const [
      // SMC Checkpoint
      LatLng(15.134791, 120.590605),
      LatLng(15.142641, 120.596763),
      LatLng(15.142916, 120.596591),
      LatLng(15.148534, 120.593641),
      LatLng(15.150004, 120.592965),
      LatLng(15.152645, 120.592214),
      LatLng(15.156963, 120.592375),
      LatLng(15.169255, 120.589403),
      LatLng(15.169700, 120.588984),
      LatLng(15.168220, 120.584124),
      LatLng(15.167805, 120.583062),
      LatLng(15.166728, 120.580133),
      LatLng(15.166319, 120.577553),
      LatLng(15.166319, 120.577553),
      LatLng(15.167821, 120.582971),
      LatLng(15.168095, 120.583851),
      LatLng(15.168297, 120.584173),
      LatLng(15.169374, 120.587633),
      LatLng(15.169234, 120.587981),
      LatLng(15.168675, 120.588201),
      LatLng(15.168525, 120.588539),
      LatLng(15.168696, 120.589119),
      LatLng(15.168541, 120.589462),
      LatLng(15.164870, 120.590406),
      LatLng(15.158729, 120.592026),
      LatLng(15.158729, 120.592026),
      LatLng(15.153002, 120.591989),
      LatLng(15.152107, 120.591576),
      LatLng(15.151172, 120.591170),
      LatLng(15.148246, 120.589899),
      LatLng(15.146913, 120.589231),
      LatLng(15.145010, 120.588700),
      LatLng(15.143464, 120.588351),
      LatLng(15.140466, 120.587625),
      LatLng(15.139179, 120.587440),
      LatLng(15.138737, 120.587539),
      LatLng(15.136984, 120.586498),
      LatLng(15.134791, 120.590610),
    ],
  ),

  /// Defines the "Marisol - Pampang" route.
  /// This route is currently incomplete and serves as a placeholder.
  JeepneyRoute(
    id: 'marisol-pampang',
    name: 'Marisol - Pampang',
    color: const Color(0xFF50C878),
    startingPoint: 'Checkpoint',

    /// The list of [LatLng] points for this route's path.
    /// This route currently has no points and needs to be populated
    /// with accurate geographical data.
    polylinePoints: const [
      // Starting in Marisol
    ],
  ),

  /// Defines the "Villa - Pampang" route.
  /// This route is currently incomplete and serves as a placeholder.
  JeepneyRoute(
    id: 'Villa-Pampang',
    name: 'Pampang - SM Telabastagan',
    color: const Color.fromARGB(255, 237, 244, 61),
    startingPoint: 'Petron Angeles City',

    /// The list of [LatLng] points for this route's path.
    /// This route currently has no points and needs to be populated
    /// with accurate geographical data.
    polylinePoints: const [
      // Starting in Petron Angeles City
      LatLng(15.12351605335029, 120.59982619263153), // Petron
      LatLng(15.123354608037458, 120.59893934573373), // Susie's Cuisine
      LatLng(15.123797912117388, 120.59915770460823), // Chevalier School
    ],
  ),
];
