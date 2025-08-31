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
      // Starting in Petron Angeles City to Sacred Heart Medical Center Emergency Room
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
      // Starting point from Central Motor Parts
      LatLng(15.125628799782437, 120.5980501802424), // Central Motor Parts
      LatLng(15.125696026067347, 120.59806603105855), // San Jacinto
      LatLng(15.125791417449632, 120.59804057194596), // Jollibee Sto. Domingo
      LatLng(15.12583337041456, 120.59800492456334), // Roundabout Sto. Domingo
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
      // Starting point from Super 8 to Lakandula intersection
      LatLng(15.12721657487298, 120.59683149550352), // Super 8
      LatLng(
        15.127832237629727,
        120.59621340300953,
      ), // Villa Angela Subdivision
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
      LatLng(15.131523691555897, 120.59384143937618), // San Jose Chapel
      LatLng(15.132196777718002, 120.59319550229161), // San Jose St.
      LatLng(15.133428593284963, 120.59180550277236), // 7-Eleven0208 HAU
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
