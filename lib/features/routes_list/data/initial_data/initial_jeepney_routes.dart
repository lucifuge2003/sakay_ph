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
      LatLng(15.150831, 120.592152),
      LatLng(15.150861, 120.592298),
      LatLng(15.150903, 120.592309),
      LatLng(15.150934, 120.592335),
      LatLng(15.150991, 120.592437),
      LatLng(15.151025, 120.592572),
      //MacArthur Highway
      LatLng(15.150794, 120.592649),
      LatLng(15.149883, 120.592990),
      LatLng(15.148607, 120.593578),
      LatLng(15.148324, 120.593714),
      LatLng(15.147501, 120.594151),
      LatLng(15.146952, 120.594446),
      LatLng(15.146406, 120.594733),
      LatLng(15.146307, 120.594744),
      LatLng(15.145301, 120.595281),
      LatLng(15.144542, 120.595678),
      LatLng(15.144451, 120.595779),
      LatLng(15.144138, 120.595951),
      LatLng(15.143579, 120.596251),
      LatLng(15.143136, 120.596482),
      //Angeles Rotonda
      LatLng(15.143019, 120.596487),
      LatLng(15.142859, 120.596531),
      LatLng(15.142693, 120.596482),
      LatLng(15.142442, 120.596382),
      //Santo Rosario (Long Road)
      LatLng(15.140749, 120.595097),
      LatLng(15.140376, 120.594848),
      LatLng(15.138939, 120.593764),
      LatLng(15.137831, 120.592957),
      LatLng(15.137121, 120.592391),
      LatLng(15.136650, 120.592038),
      LatLng(15.135951, 120.591487),
      LatLng(15.134803, 120.590605),
      //Santo Rosario Street
      LatLng(15.134863, 120.590527),
      LatLng(15.135078, 120.590186),
      LatLng(15.135210, 120.589958),
      LatLng(15.135347, 120.589725),
      LatLng(15.135562, 120.589322),
      LatLng(15.136078, 120.588384),
      LatLng(15.136399, 120.587727),
      LatLng(15.136702, 120.587091),
      //Rizal Street
      LatLng(15.136989, 120.586498),
      LatLng(15.137986, 120.587077),
      LatLng(15.138750, 120.587555),
      LatLng(15.138864, 120.587617),
      //Jake Gonzales Boulevard
      LatLng(15.139122, 120.587472),
      LatLng(15.139223, 120.587458),
      LatLng(15.140453, 120.587638),
      LatLng(15.141300, 120.587839),
      LatLng(15.141823, 120.587989),
      LatLng(15.143475, 120.588365),
      LatLng(15.144226, 120.588529),
      LatLng(15.145007, 120.588714),
      //Kalayaan Street 
      LatLng(15.145150, 120.588276),
      LatLng(15.145254, 120.588014),
      LatLng(15.145349, 120.587775),
      LatLng(15.145453, 120.587590),
      LatLng(15.145606, 120.587415),
      LatLng(15.145862, 120.587225),
      LatLng(15.146289, 120.586890),
      //Ending Point
      LatLng(15.145956, 120.586431),
      LatLng(15.146170, 120.586243),
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
      // Starting from Super 8 to Lakandula Intersection
      LatLng(15.127403325407345, 120.59671769901422),
      LatLng(15.127703757808858, 120.59652271441698),
      LatLng(15.1278615651068, 120.59642622593141),
      LatLng(15.128012444168396, 120.596342496251),
      LatLng(15.128361159135206, 120.59614313987335),
      LatLng(15.128565923065695, 120.59602831060035),
      LatLng(15.128668304958506, 120.5959653139843),
      LatLng(15.12881178387352, 120.59588403077575),
      LatLng(15.129150327738728, 120.59569091172854),
      LatLng(15.129319275814858, 120.59559837551626),
      LatLng(15.129615096448672, 120.59542939634991),
      LatLng(15.129833239629924, 120.59530199142097),
      LatLng(15.129961406737422, 120.59522219570077),
      LatLng(15.130142653014111, 120.59509814353495),
      LatLng(15.130311600299121, 120.59498079689024),
      LatLng(15.130484204964377, 120.59483821425428),
      LatLng(15.130756720959408, 120.59459547433947),
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
