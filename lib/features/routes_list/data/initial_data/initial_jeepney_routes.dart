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
      // Starting point: Petron Angeles City to Super 8
      LatLng(15.122731058388403, 120.59965515279961),
      LatLng(15.123005871079897, 120.59943303465782),
      LatLng(15.123679942640194, 120.59899055468584),
      LatLng(15.124529487325207, 120.59850502299147),
      LatLng(15.124467135411814, 120.59840714982742),
      LatLng(15.12461685386126, 120.59846306751389),
      LatLng(15.124734666929308, 120.59840741167632),
      LatLng(15.124965264192484, 120.59830046027554),
      LatLng(15.125162627577119, 120.59821693394576),
      LatLng(15.125357349254623, 120.59815926645241),
      LatLng(15.12554248340152, 120.59809288177934),
      LatLng(15.125628799782437, 120.5980501802424),
      LatLng(15.125696026067347, 120.59806603105855),
      LatLng(15.125791417449632, 120.59804057194596),
      LatLng(15.12583337041456, 120.59800492456334),
      LatLng(15.125858568081476, 120.59783400966887),
      LatLng(15.125835892804771, 120.59777652227956),
      LatLng(15.125919397197638, 120.5976336946511),
      LatLng(15.126047884804619, 120.59749543012994),
      LatLng(15.126202156588194, 120.59741758978903),
      LatLng(15.126704680470866, 120.59711258858384),
      LatLng(15.127044449383183, 120.59690594504816),

      // Starting point: Super 8 to Lakandula Intersection
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
      LatLng(15.131632981512702, 120.59397742152214),
      LatLng(15.13222267400756, 120.59318147599699),
      LatLng(15.132896487577991, 120.59253273834481),
      LatLng(15.133351078675798, 120.5920595540646),
      LatLng(15.133516139618333, 120.59189660986546),
      LatLng(15.133554996677605, 120.59186594040453),

      // Starting point: Lakandula Intersection to Lakandula-Miranda Intersection
      LatLng(15.133865699214875, 120.59212209136194),
      LatLng(15.134026428417577, 120.59223553252144),
      LatLng(15.134337777562695, 120.59244474482702),
      LatLng(15.134750104104418, 120.59271430683306),
      LatLng(15.134990897255605, 120.59287389826821),

      // Starting point: Lakandula-Miranda Intersection to Miranda-Sto. Entierro Intersection
      LatLng(15.135163724429122, 120.59262378228006),
      LatLng(15.135388317481578, 120.5922876775703),
      LatLng(15.13557473744732, 120.59201811556609),
      LatLng(15.135781223259858, 120.59170697931971),
      LatLng(15.135926863603009, 120.59149173204362),

      // Starting point: Miranda-Sto. Entierro Intersection to Miranda-Rizal St. Intersection
      LatLng(15.135952107919882, 120.5914394289643),
      LatLng(15.136244676311298, 120.59102985492237),
      LatLng(15.136681324135166, 120.59044190638865),
      LatLng(15.136701149179396, 120.5903970853183),
      LatLng(15.13701350968831, 120.58996764595089),
      LatLng(15.137817230997701, 120.58884675052037),
      LatLng(15.138282252875294, 120.5882113867779),
      LatLng(15.13849101030926, 120.58796593648201),
      LatLng(15.138811790729347, 120.58754996259077),

      // Starting point: Miranda-Rizal St. Intersection to Rizal Exit-Sto. Rosario St. Intersection
      LatLng(15.138429761559097, 120.58731852534687),
      LatLng(15.138116545579049, 120.58711772153018),
      LatLng(15.137998092666093, 120.5870493252008),
      LatLng(15.13778387892748, 120.5869371318918),
      LatLng(15.137359920124332, 120.58672232112863),
      LatLng(15.136951782613563, 120.58649656213558),

      // Starting point: Rizal Exit-Sto. Rosario St. Intersection to Sto. Rosario-Sto. Entierro St. Intersection
      LatLng(15.136755921693164, 120.58691025087633),
      LatLng(15.13641264529873, 120.58763475520163),
      LatLng(15.136350765793864, 120.58776509493288),
      LatLng(15.136082552039452, 120.58828666217963),
      LatLng(15.135809760908668, 120.58881486755652),
      LatLng(15.135612268739063, 120.58919664439189),
      LatLng(15.135377008773576, 120.58967269304263),
      LatLng(15.134824823005918, 120.59060629282624),

      // Starting point: Sto. Rosario-Sto. Entierro St. Intersection to Super 8
      LatLng(15.134377278994, 120.591062207231),
      LatLng(15.133564317293288, 120.59180825257585),
      LatLng(15.133023406944917, 120.59235846971373),
      LatLng(15.13241560190105, 120.5929367395061),
      LatLng(15.132198436745146, 120.59316575608403),
      LatLng(15.132073273360701, 120.59328548279788),
      LatLng(15.13157314145807, 120.59376668532873),
      LatLng(15.131105196457245, 120.59422580336332),
      LatLng(15.130504344056627, 120.59479988727537),
      LatLng(15.130280485443661, 120.59497345786016),
      LatLng(15.129946333558093, 120.59520856357754),
      LatLng(15.128244553724116, 120.59617358716493),
      LatLng(15.127320889013596, 120.5966956205774),
      LatLng(15.126967818634922, 120.5969402167569),

      // Starting point: Super 8 to Sto. Domingo Roundabout
      LatLng(15.126180463429344, 120.59740730632271),
      LatLng(15.126002010472655, 120.59751215552811),
      LatLng(15.125877406096079, 120.59755607999452),
      LatLng(15.125723990991423, 120.59771298922298),
      LatLng(15.125648254378694, 120.59772237695574),
      LatLng(15.125581952771777, 120.59776611018235),
      LatLng(15.125543760783437, 120.59782377767483),

      // Starting point: Sto. Domingo Roundabout to Petron Sto. Domingo
      LatLng(15.12515743918525, 120.5980252407839),
      LatLng(15.124459167056687, 120.5984074770705),
      LatLng(15.123768458450613, 120.59880071461562),
      LatLng(15.123591859632686, 120.59891597500996),
      LatLng(15.123189889625102, 120.59920685535513),
      LatLng(15.12291933808336, 120.59939147251431),
      LatLng(15.12297059427831, 120.59945477753458),
      LatLng(15.12296735762843, 120.5994815996267),
      LatLng(15.12275503335803, 120.59965594321038),
    ],
  ),
];
