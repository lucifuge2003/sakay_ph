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
      // Starting point: Petron Angeles City to Super 8
      LatLng(15.122731058388403, 120.59965515279961), // Petron Angeles City
      LatLng(15.123005871079897, 120.59943303465782),
      LatLng(15.123679942640194, 120.59899055468584),
      LatLng(15.124529487325207, 120.59850502299147),
      LatLng(15.124734666929308, 120.59840741167632),
      LatLng(15.124965264192484, 120.59830046027554),
      LatLng(15.125357349254623, 120.59815926645241),
      LatLng(15.125628799782437, 120.5980501802424),
      LatLng(15.125858568081476, 120.59783400966887),
      LatLng(15.126202156588194, 120.59741758978903),
      LatLng(15.126704680470866, 120.59711258858384),
      LatLng(15.127044449383183, 120.59690594504816),

      // Super 8 to Lakandula Intersection
      LatLng(15.127403325407345, 120.59671769901422),
      LatLng(15.128012444168396, 120.596342496251),
      LatLng(15.128565923065695, 120.59602831060035),
      LatLng(15.129150327738728, 120.59569091172854),
      LatLng(15.129833239629924, 120.59530199142097),
      LatLng(15.130311600299121, 120.59498079689024),
      LatLng(15.130756720959408, 120.59459547433947),

      // Lakandula to Miranda Intersection
      LatLng(15.133865699214875, 120.59212209136194),
      LatLng(15.134750104104418, 120.59271430683306),
      LatLng(15.134990897255605, 120.59287389826821),

      // Miranda to Sto. Entierro Intersection
      LatLng(15.135163724429122, 120.59262378228006),
      LatLng(15.13557473744732, 120.59201811556609),
      LatLng(15.135926863603009, 120.59149173204362),

      // Miranda to Rizal St. Intersection
      LatLng(15.136244676311298, 120.59102985492237),
      LatLng(15.136681324135166, 120.59044190638865),
      LatLng(15.13701350968831, 120.58996764595089),
      LatLng(15.137817230997701, 120.58884675052037),
      LatLng(15.138282252875294, 120.5882113867779),
      LatLng(15.13849101030926, 120.58796593648201),
      LatLng(15.138811790729347, 120.58754996259077),

      // Rizal to Sto. Rosario St.
      LatLng(15.13778387892748, 120.5869371318918),
      LatLng(15.136951782613563, 120.58649656213558),

      // Sto. Rosario to Super 8
      LatLng(15.13641264529873, 120.58763475520163),
      LatLng(15.136082552039452, 120.58828666217963),
      LatLng(15.135612268739063, 120.58919664439189),
      LatLng(15.134824823005918, 120.59060629282624),
      LatLng(15.133564317293288, 120.59180825257585),
      LatLng(15.13241560190105, 120.5929367395061),
      LatLng(15.13157314145807, 120.59376668532873),
      LatLng(15.130504344056627, 120.59479988727537),
      LatLng(15.129946333558093, 120.59520856357754),
      LatLng(15.128244553724116, 120.59617358716493),
      LatLng(15.127320889013596, 120.5966956205774),
      LatLng(15.126967818634922, 120.5969402167569),

      // Back to Sto. Domingo Roundabout → Petron
      LatLng(15.126180463429344, 120.59740730632271),
      LatLng(15.125723990991423, 120.59771298922298),
      LatLng(15.125543760783437, 120.59782377767483),
      LatLng(15.124459167056687, 120.5984074770705),
      LatLng(15.123768458450613, 120.59880071461562),
      LatLng(15.123189889625102, 120.59920685535513),
      LatLng(15.122731058388403, 120.59965515279961),
    ],
  ),
];
