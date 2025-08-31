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


      LatLng(15.1667401, 120.5797973),
      LatLng(15.1667408, 120.5798013),
      LatLng(15.1668722, 120.5799247),
      LatLng(15.1669673, 120.5800252),
      LatLng(15.1669919, 120.5801345),
      LatLng(15.1669835, 120.5802512),
      LatLng(15.1669744, 120.5803853),
      LatLng(15.1669699, 120.5804973),
      LatLng(15.1669634, 120.5805677),
      LatLng(15.1667667, 120.5799287),
      LatLng(15.1668061, 120.5800856),
      LatLng(15.1669569, 120.5805650),
      LatLng(15.1670113, 120.5807320),
      LatLng(15.1671763, 120.5811303),
      LatLng(15.1672961, 120.5814394),
      LatLng(15.1674760, 120.5818907),
      LatLng(15.1676436, 120.5823755),
      LatLng(15.167836, 120.582966),
      LatLng(15.168098, 120.583813),
      LatLng(15.168300, 120.584127),
      LatLng(15.168613, 120.585189),
      LatLng(15.169338, 120.587456),
      LatLng(15.169356, 120.587745),
      LatLng(15.169201, 120.588016),
      LatLng(15.168939, 120.588113),
      LatLng(15.168696, 120.588207),
      LatLng(15.168569, 120.588542),
      LatLng(15.168704, 120.589043),
      LatLng(15.168634, 120.589371),
      LatLng(15.168396, 120.589580),
      LatLng(15.167728, 120.589693),
      LatLng(15.165646, 120.590234),
      LatLng(15.164725, 120.590460),
      LatLng(15.163234, 120.590867),
      LatLng(15.160883, 120.591500),
      LatLng(15.158589, 120.592074),
      LatLng(15.156994, 120.592241),
      LatLng(15.154737, 120.592085),
      LatLng(15.152919, 120.591951),
      LatLng(15.152039, 120.591602),
      LatLng(15.149958, 120.590653),
      LatLng(15.148254, 120.589961),
      LatLng(15.147146, 120.589371),
      LatLng(15.146395, 120.589103),
      LatLng(15.144821, 120.588689),
      LatLng(15.143454, 120.588357),
      LatLng(15.142040, 120.588051),
      LatLng(15.140834, 120.587729),
      LatLng(15.139715, 120.587541),
      LatLng(15.139099, 120.587461),
      LatLng(15.138633, 120.587579),
      LatLng(15.138462, 120.587372),
      LatLng(15.137600, 120.586871),
      LatLng(15.136955, 120.586517),
      LatLng(15.136753, 120.586962),
      LatLng(15.136370, 120.587740),
      LatLng(15.135790, 120.588904),
      LatLng(15.135065, 120.590165),
      LatLng(15.134770, 120.590594),
      LatLng(15.135915, 120.591506),
      LatLng(15.137326, 120.592585),
      LatLng(15.138959, 120.593829),
      LatLng(15.140865, 120.595213),
      LatLng(15.142434, 120.596371),
      LatLng(15.142587, 120.596575),
      LatLng(15.142626, 120.596733),
      LatLng(15.142799, 120.596763),
      LatLng(15.142895, 120.596645),
      LatLng(15.143094, 120.596521),
      LatLng(15.143609, 120.596229),
      LatLng(15.144086, 120.595990),
      LatLng(15.144448, 120.595787),
      LatLng(15.144899, 120.595610),
      LatLng(15.146349, 120.594783),
      LatLng(15.147519, 120.594129),
      LatLng(15.148632, 120.593560),
      LatLng(15.150320, 120.592804),
      LatLng(15.152117, 120.592273),
      LatLng(15.152723, 120.592192),
      LatLng(15.152987, 120.592107),
      LatLng(15.154602, 120.592166),
      LatLng(15.156818, 120.592289),
      LatLng(15.157813, 120.592289),
      LatLng(15.158703, 120.592058),
      LatLng(15.160391, 120.591629),
      LatLng(15.162296, 120.591125),
      LatLng(15.164637, 120.590519),
      LatLng(15.165978, 120.590218),
      LatLng(15.168468, 120.589564),
      LatLng(15.169483, 120.589312),
      LatLng(15.169716, 120.588995),
      LatLng(15.169571, 120.588271),
      LatLng(15.169410, 120.588094),
      LatLng(15.169141, 120.588030),
      LatLng(15.168846, 120.588142),
      LatLng(15.168644, 120.588207),
      LatLng(15.168401, 120.588110),
      LatLng(15.167992, 120.586919),
      LatLng(15.167427, 120.585208),
      LatLng(15.167169, 120.583679),
      LatLng(15.167034, 120.582574),
      LatLng(15.166723, 120.580718),
      LatLng(15.166573, 120.579774),
      LatLng(15.166449, 120.579098),
      LatLng(15.1665990, 120.5790617),
      LatLng(15.1667272, 120.5797872),
      LatLng(15.1668061, 120.5801077),
      LatLng(15.1669149, 120.5804484),
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
];
