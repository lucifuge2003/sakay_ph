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
      //Starting Point
      LatLng(15.150774, 120.592149),
      LatLng(15.151016, 120.592579),
      //Angeles Rotonda
      LatLng(15.142901, 120.596569),
      LatLng(15.142442, 120.596382),
      //Santo Rosario (Long Road)
      LatLng(15.138918, 120.593764),
      LatLng(15.134803, 120.590605),
      //Rizal Street to Jake Gonzales Boulevard
      LatLng(15.136997, 120.586486),
      LatLng(15.13885, 120.58757),
      LatLng(15.140453, 120.587638),
      LatLng(15.14500, 120.58870),
      //Kalayaan Street to Other Terminal
      LatLng(15.145453, 120.587590),
      LatLng(15.146267, 120.586870),
      LatLng(15.145956, 120.586431),
      LatLng(15.146170, 120.586243)
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
      LatLng(15.122731058388403, 120.59965515279961), // Petron
      LatLng(15.123005871079897, 120.59943303465782), // San Juan St.
      LatLng(15.123679942640194, 120.59899055468584), // Chevalier School
      LatLng(15.124529487325207, 120.59850502299147), // Chevalier School Field
      LatLng(15.124467135411814, 120.59840714982742), // 7-Eleven Sto Domingo
      LatLng(15.12461685386126, 120.59846306751389), // Sto Domingo Footbridge
      LatLng(
        15.124734666929308,
        120.59840741167632,
      ), // Compac 12 Police Station
      LatLng(15.124965264192484, 120.59830046027554), // San Pedro Street
      LatLng(15.125162627577119, 120.59821693394576), // Med Express Drugstore
      LatLng(
        15.125357349254623,
        120.59815926645241,
      ), // Sacred Heart Medical Center
      LatLng(
        15.12554248340152,
        120.59809288177934,
      ), // Sacred Heart Medical Center Emergency Room
      LatLng(15.125628799782437, 120.5980501802424), // Central Motor Parts
      LatLng(15.125696026067347, 120.59806603105855), // San Jacinto
      LatLng(15.125791417449632, 120.59804057194596), // Jollibee Sto. Domingo
      LatLng(15.12583337041456, 120.59800492456334), // Rounabout Sto. Domingo
      LatLng(
        15.125858568081476,
        120.59783400966887,
      ), // Rounabout Sto. Domingo Left road
      LatLng(
        15.125835892804771,
        120.59777652227956,
      ), // Roundabout Sto. Domingo Left side
      LatLng(
        15.125919397197638,
        120.5976336946511,
      ), // Migs Masters Institute for Graphics Inc.
      LatLng(
        15.126047884804619,
        120.59749543012994,
      ), // DAR Electronics Workshop
      LatLng(15.126202156588194, 120.59741758978903), // Mary Roche' Marketing
      LatLng(15.126704680470866, 120.59711258858384), // EM-A Group Of Companies
      LatLng(15.127044449383183, 120.59690594504816), // Super 8
      LatLng(
        15.127832237629727,
        120.59621340300953,
      ), // Villa Angela Subdivision
      LatLng(15.128858362833622, 120.59557894352434), // Carmelite Monastery
      LatLng(15.130219488187741, 120.59518495015432), // LBS Bakeshop
      LatLng(15.131087951427093, 120.59404447674753), // Villa Gloria
      LatLng(15.131632981512702, 120.59397742152214), // San Jose Chapel
      LatLng(15.13222267400756, 120.59318147599699), // San Jose St.
      LatLng(15.133428593284963, 120.59180550277236), // 7-Eleven0208 HAU
      LatLng(15.13278, 120.59021), // Holy Angel University (HAU)
      LatLng(15.133570351458845, 120.59189133346085), // Lakundala St.
      LatLng(15.135241923552242, 120.59204413356498), // Belajandrino Hotel
      LatLng(15.135801333950631, 120.59148242319246), // Pamintuan Mansion
      LatLng(15.137865230012007, 120.5888958062399), // Plaridel St.
      LatLng(15.138362343742887, 120.58831711964498), // Happy Go Shopping
      LatLng(15.138768836916656, 120.58798989014517), // Puregold Angeles
      LatLng(15.138789549923345, 120.5878081704844), // San Nicolas Market
      LatLng(15.13869504681557, 120.58755403118023), // Jollibee Rotonda
      LatLng(
        15.137357111252221,
        120.58676680283438,
      ), // Angeles City Fire Station
      LatLng(15.136945989705877, 120.5864953706753), // Rizal Street Ext
      LatLng(15.136144731926045, 120.5878596735503), // Jenra Mall
      LatLng(15.136047690654795, 120.58832230188303), // Teresita St.
      LatLng(15.13551302064991, 120.58914668294597), // Nepo Mall Entrance
      LatLng(15.134609122255796, 120.59036980262138), // Holy Rosary Parish
      LatLng(15.134333314868433, 120.59109874280043), // St. Joseph St. Entrance
      LatLng(15.12341125540442, 120.59905009345266), // Susie's Cuisine
    ],
  ),
];
