import 'package:flutter/widgets.dart'; // Provides the Color class for defining route colors.
import 'package:latlong2/latlong.dart'; // Provides the LatLng class for geographical coordinates.
import 'package:sakay_ph/features/routes_list/data/models/jeepney_route.dart'; // Imports the custom JeepneyRoute data model.

/// This file contains a predefined list of static jeepney routes.
///
/// Each route is represented by a [JeepneyRoute] object, which holds
/// all the necessary data to display the route on a map, including its
/// name, color, and geographical path. This data is hardcoded for
/// demonstration or for applications where routes are fixed.
final initialJeepneyRoutes = <JeepneyRoute>[
  JeepneyRoute(
    id: 'capaya',
    name: 'Capaya - Angeles',
    color: const Color.fromARGB(255, 203, 71, 141),
    startingPoint: ' ',

    /// The list of [LatLng] points for this route's path.
    /// This route currently has no points and needs to be populated
    /// with accurate geographical data.
    polylinePoints: const [
      //Starting Point - San Vicente Street
      LatLng(15.146776, 120.614065),
      LatLng(15.148050, 120.614058),
      LatLng(15.148712, 120.614060),
      LatLng(15.148814, 120.614079),
      LatLng(15.148956, 120.614149),
      LatLng(15.149290, 120.614318),
      LatLng(15.149909, 120.614618),
      //Pandan-Tabun Road
      LatLng(15.150020, 120.614312),
      LatLng(15.150056, 120.614288),
      LatLng(15.150530, 120.613068),
      LatLng(15.150530, 120.613068),
      LatLng(15.151356, 120.610984),
      LatLng(15.151356, 120.610984),
      LatLng(15.151892, 120.609570),
      LatLng(15.152415, 120.608259),
      LatLng(15.152917, 120.606963),
      LatLng(15.153308, 120.605944),
      LatLng(15.153663, 120.605043),
      LatLng(15.153673, 120.604992),
      LatLng(15.153660, 120.604949),
      LatLng(15.153712, 120.604817),
      //Magalang-Angeles Road
      LatLng(15.151477, 120.603644),
      LatLng(15.151232, 120.603495),
      LatLng(15.150632, 120.603017),
      LatLng(15.149627, 120.602191),
      LatLng(15.149223, 120.601885),
      LatLng(15.148094, 120.600963),
      LatLng(15.146060, 120.599236),
      LatLng(15.144594, 120.597986),
      LatLng(15.143170, 120.596918),
      LatLng(15.143113, 120.596878),
      LatLng(15.142970, 120.596709),
      LatLng(15.142900, 120.596666),
      LatLng(15.142885, 120.596580),
      LatLng(15.142825, 120.596521),
      LatLng(15.142719, 120.596505),
      LatLng(15.142546, 120.596411),
      LatLng(15.142468, 120.596387),
      //Santo Entierro Street
      LatLng(15.142009, 120.596054),
      LatLng(15.140739, 120.595084),
      LatLng(15.140379, 120.594853),
      LatLng(15.139729, 120.594362),
      LatLng(15.138874, 120.593710),
      LatLng(15.138411, 120.593386),
      LatLng(15.137831, 120.592962),
      LatLng(15.137095, 120.592380),
      LatLng(15.136648, 120.592042),
      //Jesus Street
      LatLng(15.137191, 120.591401),
      LatLng(15.138089, 120.590430),
      LatLng(15.138706, 120.589781),
      LatLng(15.139092, 120.589392),
      LatLng(15.139345, 120.589110),
      LatLng(15.139941, 120.588386),
      //Rizal Street
      LatLng(15.139511, 120.588072),
      LatLng(15.138701, 120.587520),
      LatLng(15.137986, 120.587075),
      LatLng(15.137267, 120.586656),
      LatLng(15.136988, 120.586500),
      //Santo Rosario Street
      LatLng(15.136694, 120.587107),
      LatLng(15.136396, 120.587737),
      //Plaridel Street - Ending point, Angeles to Capaya takes the same road
      LatLng(15.136769, 120.587941),
      LatLng(15.136901, 120.588029),
      LatLng(15.137196, 120.588241),
      LatLng(15.137523, 120.588509),
      LatLng(15.137709, 120.588676),
      LatLng(15.137880, 120.588829),
      LatLng(15.137820, 120.588909),
      LatLng(15.138043, 120.589121),
      LatLng(15.138292, 120.589354),
      LatLng(15.138706, 120.589781),
    ],
  ),
  
  
  JeepneyRoute(
    id: 'sapangbato',
    name: 'Sapangbato - Angeles',
    color: const Color.fromARGB(255, 203, 71, 71),
    startingPoint: 'Pampang Road',

    /// The list of [LatLng] points for this route's path.
    /// This route currently has no points and needs to be populated
    /// with accurate geographical data.
    polylinePoints: const [
      // Starting in Pampang Road
      // Starting point - Pampang Road
      LatLng(15.141774, 120.587892),
      LatLng(15.141852, 120.587914),
      LatLng(15.141999, 120.587641),
      LatLng(15.142180, 120.587340),
      LatLng(15.142364, 120.587045),
      LatLng(15.142639, 120.586675),
      LatLng(15.142833, 120.586329),
      LatLng(15.143195, 120.585739),
      LatLng(15.143511, 120.585237),
      LatLng(15.143767, 120.584808),
      LatLng(15.144169, 120.584170),
      LatLng(15.144477, 120.583749),
      LatLng(15.144754, 120.583387),
      LatLng(15.145034, 120.583030),
      LatLng(15.145676, 120.582209),
      LatLng(15.146191, 120.581520),
      LatLng(15.146727, 120.580814),
      LatLng(15.147084, 120.580369),
      LatLng(15.147793, 120.579396),
      LatLng(15.147892, 120.579253),
      LatLng(15.147959, 120.579189),
      LatLng(15.148027, 120.579141),
      LatLng(15.148099, 120.579124),
      LatLng(15.148435, 120.579127),
      LatLng(15.148935, 120.579114),
      LatLng(15.149324, 120.579135),
      //Arayat Boulevard
      LatLng(15.149303, 120.578417),
      LatLng(15.149155, 120.577877),
      LatLng(15.148995, 120.577183),
      LatLng(15.148632, 120.575826),
      LatLng(15.148557, 120.575589),
      LatLng(15.148350, 120.574780),
      //Poinsettia Avenue
      LatLng(15.147951, 120.573841),
      LatLng(15.147563, 120.573049),
      LatLng(15.147139, 120.571958),
      LatLng(15.146722, 120.570888),
      LatLng(15.146372, 120.569970),
      LatLng(15.146194, 120.569407),
      LatLng(15.145961, 120.568793),
      LatLng(15.145769, 120.568103),
      LatLng(15.145632, 120.567543),
      LatLng(15.145321, 120.566321),
      LatLng(15.145176, 120.565738),
      LatLng(15.145013, 120.564622),
      LatLng(15.144902, 120.563799),
      LatLng(15.144754, 120.562401),
      LatLng(15.144632, 120.561213),
      LatLng(15.144503, 120.559968),
      LatLng(15.144467, 120.559485),
      LatLng(15.144557, 120.559399),
      //Friendship Highway
      LatLng(15.145865, 120.559397),
      LatLng(15.147723, 120.559394),
      LatLng(15.149184, 120.559370),
      LatLng(15.149756, 120.559389),
      LatLng(15.150193, 120.559386),
      LatLng(15.150626, 120.559399),
      LatLng(15.150861, 120.559399),
      LatLng(15.151703, 120.559405),
      LatLng(15.152074, 120.559411),
      LatLng(15.152208, 120.559432),
      LatLng(15.152381, 120.559499),
      LatLng(15.152604, 120.559614),
      LatLng(15.152777, 120.559740),
      LatLng(15.153059, 120.559973),
      LatLng(15.153277, 120.560142),
      LatLng(15.153479, 120.560236),
      LatLng(15.153717, 120.560287),
      LatLng(15.153986, 120.560303),
      LatLng(15.154786, 120.560298),
      LatLng(15.155061, 120.560290),
      //Frienship Bridge
      LatLng(15.155175, 120.560309),
      LatLng(15.155325, 120.560306),
      LatLng(15.155560, 120.560271),
      LatLng(15.156197, 120.560151),
      LatLng(15.156844, 120.560027),
      LatLng(15.157662, 120.559872),
      LatLng(15.157836, 120.559823),
      LatLng(15.157937, 120.559783),
      LatLng(15.158048, 120.559695),
      LatLng(15.158095, 120.559630),
      LatLng(15.158126, 120.559523),
      LatLng(15.158155, 120.559410),
      //Friendship Highway continued
      LatLng(15.158362, 120.558667),
      LatLng(15.158727, 120.557530),
      LatLng(15.158799, 120.557372),
      LatLng(15.158947, 120.557138),
      LatLng(15.159167, 120.556886),
      LatLng(15.159317, 120.556758),
      LatLng(15.159514, 120.556621),
      LatLng(15.159876, 120.556425),
      LatLng(15.161069, 120.555789),
      LatLng(15.162028, 120.555277),
      LatLng(15.163016, 120.554746),
      //Ending Point - Don Meliton Avenue
      LatLng(15.162737, 120.554113),
      LatLng(15.162576, 120.553579),
      LatLng(15.162514, 120.553228),
      LatLng(15.162493, 120.552640),
      LatLng(15.162527, 120.552101),
    ],
  ),


  JeepneyRoute(
    id: 'carmenville',
    name: 'Carmenville - Angeles',
    color: const Color.fromARGB(255, 235, 120, 25),
    startingPoint: ' ',

    /// The list of [LatLng] points for this route's path.
    /// This route currently has no points and needs to be populated
    /// with accurate geographical data.
    polylinePoints: const [
      // Starting in Sunset, Nepo
      //Starting & Ending Point - Sunset, Nepo
      LatLng(15.135233, 120.566695),
      LatLng(15.135123, 120.566545),
      LatLng(15.135526, 120.566127),
      LatLng(15.135757, 120.565893),
      LatLng(15.135961, 120.565697),
      LatLng(15.136531, 120.565137),
      LatLng(15.137088, 120.564592),
      //Avenue of 1976
      LatLng(15.137370, 120.564922),
      LatLng(15.137538, 120.565099),
      LatLng(15.137901, 120.565496),
      LatLng(15.138235, 120.565875),
      LatLng(15.138561, 120.566215),
      LatLng(15.138866, 120.566564),
      LatLng(15.139198, 120.566923),
      LatLng(15.139762, 120.567470),
      LatLng(15.140166, 120.567789),
      LatLng(15.140596, 120.568125),
      LatLng(15.141051, 120.568436),
      LatLng(15.141500, 120.568771),
      LatLng(15.141935, 120.569106),
      LatLng(15.142403, 120.569436),
      //Taguete Avenue
      LatLng(15.142085, 120.569911),
      LatLng(15.141756, 120.570372),
      LatLng(15.141624, 120.570555),
      LatLng(15.141567, 120.570641),
      LatLng(15.141510, 120.570780),
      LatLng(15.141481, 120.570917),
      LatLng(15.141474, 120.571027),
      LatLng(15.141489, 120.571526),
      LatLng(15.141497, 120.571636),
      LatLng(15.141484, 120.572134),
      LatLng(15.141481, 120.572413),
      LatLng(15.141461, 120.572690),
      LatLng(15.141445, 120.572845),
      LatLng(15.141375, 120.573250),
      LatLng(15.140940, 120.574320),
      LatLng(15.140790, 120.574607),
      //Camia Road
      LatLng(15.140738, 120.574685),
      LatLng(15.140689, 120.574771),
      LatLng(15.140601, 120.574892),
      LatLng(15.140399, 120.575101),
      LatLng(15.139387, 120.576104),
      LatLng(15.138662, 120.576801),
      LatLng(15.138253, 120.577204),
      LatLng(15.137800, 120.577654),
      LatLng(15.137383, 120.578046),
      LatLng(15.136969, 120.578462),
      LatLng(15.136202, 120.579215),
      LatLng(15.135441, 120.579956),
      LatLng(15.134985, 120.580398),
      LatLng(15.134229, 120.581160),
      LatLng(15.133787, 120.581597),
      LatLng(15.133719, 120.581651),
      LatLng(15.133302, 120.581925),
      LatLng(15.133147, 120.581989),
      //Rizal Street Extension
      LatLng(15.133248, 120.582346),
      LatLng(15.133292, 120.582509),
      LatLng(15.133333, 120.582745),
      LatLng(15.133380, 120.583022),
      LatLng(15.133561, 120.584108),
      LatLng(15.133590, 120.584266),
      LatLng(15.133613, 120.584400),
      LatLng(15.133647, 120.584913),
      LatLng(15.133603, 120.585234),
      //Don Juan Nepomuceno Avenue
      LatLng(15.133463, 120.585468),
      LatLng(15.133352, 120.585674),
      LatLng(15.133238, 120.585849),
      LatLng(15.133170, 120.585961),
      LatLng(15.133015, 120.586179),
      LatLng(15.132914, 120.586272),
      LatLng(15.132854, 120.586323),
      //Teresa Avenue
      LatLng(15.133473, 120.586726),
      LatLng(15.134294, 120.587254),
      LatLng(15.134806, 120.587587),
      LatLng(15.135249, 120.587858),
      //Catalina Street
      LatLng(15.135588, 120.587305),
      LatLng(15.135884, 120.586812),
      LatLng(15.136342, 120.586106),
      //Rizal Street Extension
      LatLng(15.135355, 120.585498),
      LatLng(15.134620, 120.585039),
      LatLng(15.134027, 120.584623),
      LatLng(15.133797, 120.584462),
      LatLng(15.133724, 120.584403),
      LatLng(15.133618, 120.584226),
      LatLng(15.133561, 120.584108),
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
      LatLng(15.133558161651663, 120.59187110736522),

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


  /// Defines the "Marisol - Pampang" route.
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


  JeepneyRoute(
    id: 'pandan',
    name: 'Pandan - Angeles',
    color: const Color.fromARGB(255, 25, 137, 235),
    startingPoint: ' ',

    /// The list of [LatLng] points for this route's path.
    /// This route currently has no points and needs to be populated
    /// with accurate geographical data.
    polylinePoints: const [
      // Starting in Marquee Mall Bus and Jeepney Terminal
      //Starting & Ending Point - Don Aniceto Geuco Avenue
      LatLng(15.162054, 120.608199),
      LatLng(15.162002, 120.608307),
      LatLng(15.162276, 120.608492),
      LatLng(15.162333, 120.608540),
      LatLng(15.162268, 120.608642),
      LatLng(15.162136, 120.608792),
      LatLng(15.162074, 120.608854),
      LatLng(15.162020, 120.608897),
      LatLng(15.161890, 120.608980),
      LatLng(15.161831, 120.609010),
      LatLng(15.161699, 120.609077),
      LatLng(15.161492, 120.609154),
      LatLng(15.161380, 120.609179),
      LatLng(15.161222, 120.609230),
      LatLng(15.161052, 120.609259),
      LatLng(15.160997, 120.609227),
      LatLng(15.160912, 120.609213),
      LatLng(15.160834, 120.609235),
      LatLng(15.160746, 120.609195),
      LatLng(15.160679, 120.609141),
      LatLng(15.160591, 120.609034),
      //Magalang-Angeles Road
      LatLng(15.160404, 120.608605),
      LatLng(15.160308, 120.608444),
      LatLng(15.160158, 120.608283),
      LatLng(15.159995, 120.608175),
      LatLng(15.159190, 120.607709),
      LatLng(15.158152, 120.607132),
      LatLng(15.156925, 120.606494),
      LatLng(15.155333, 120.605662),
      LatLng(15.154597, 120.605281),
      LatLng(15.153717, 120.604820),
      LatLng(15.152656, 120.604254),
      LatLng(15.151786, 120.603801),
      LatLng(15.151457, 120.603637),
      LatLng(15.151224, 120.603490),
      LatLng(15.150639, 120.603028),
      LatLng(15.149862, 120.602382),
      LatLng(15.149629, 120.602205),
      LatLng(15.149425, 120.602036),
      LatLng(15.149218, 120.601886),
      LatLng(15.148682, 120.601438),
      LatLng(15.148091, 120.600960),
      LatLng(15.147812, 120.600722),
      LatLng(15.147294, 120.600276),
      LatLng(15.146056, 120.599239),
      LatLng(15.145642, 120.598898),
      LatLng(15.144853, 120.598222),
      LatLng(15.144262, 120.597728),
      LatLng(15.143765, 120.597372),
      LatLng(15.143110, 120.596875),
      LatLng(15.143019, 120.596765),
      LatLng(15.142968, 120.596701),
      LatLng(15.142892, 120.596666),
      LatLng(15.142890, 120.596575),
      LatLng(15.142841, 120.596527),
      LatLng(15.142724, 120.596505),
      LatLng(15.142657, 120.596460),
      LatLng(15.142551, 120.596411),
      LatLng(15.142442, 120.596382),
      //Santo Entierro Street
      LatLng(15.140749, 120.595097),
      LatLng(15.140376, 120.594848),
      LatLng(15.138939, 120.593764),
      LatLng(15.137831, 120.592957),
      LatLng(15.137121, 120.592391),
      LatLng(15.136650, 120.592038),
      LatLng(15.135951, 120.591487),
      LatLng(15.134803, 120.590605),
      //Dalan Santo Rosario
      LatLng(15.134863, 120.590527),
      LatLng(15.135078, 120.590186),
      LatLng(15.135210, 120.589958),
      LatLng(15.135347, 120.589725),
      LatLng(15.135562, 120.589322),
      LatLng(15.136078, 120.588384),
      LatLng(15.136399, 120.587727),
      LatLng(15.136702, 120.587091),
      LatLng(15.136989, 120.586498),
      //Rizal Street Extension
      LatLng(15.136342, 120.586104),
      LatLng(15.135353, 120.585495),
      LatLng(15.134618, 120.585039),
      LatLng(15.134025, 120.584626),
      //Don Juan Nepomuceno Avenue
      LatLng(15.133576, 120.585284),
      LatLng(15.133463, 120.585460),
      LatLng(15.133359, 120.585656),
      LatLng(15.133173, 120.585953),
      LatLng(15.133012, 120.586176),
      LatLng(15.132911, 120.586275),
      LatLng(15.132852, 120.586321),
      //Teresa Avenue
      LatLng(15.133473, 120.586726),
      LatLng(15.134294, 120.587254),
      LatLng(15.134806, 120.587587),
      LatLng(15.135249, 120.587858),
      LatLng(15.136078, 120.588384),
    ],
  ),

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

  JeepneyRoute(
    id: 'checkpoint-balibago',
    name: 'Checkpoint - Holy Angel University - Balibago',
    color: const Color.fromARGB(255, 87, 79, 84),
    startingPoint: ' ',

    /// The list of [LatLng] points for this route's path.
    /// This route currently has no points and needs to be populated
    /// with accurate geographical data.
    polylinePoints: const [
      // Starting in Pampang Road
      //Starting Point
      
      //Ending Point
      
    ],
  ),


  JeepneyRoute(
    id: 'hensonville',
    name: 'Checkpoint - Hensonville - Angeles',
    color: const Color.fromARGB(255, 235, 232, 233),
    startingPoint: ' ',

    /// The list of [LatLng] points for this route's path.
    /// This route currently has no points and needs to be populated
    /// with accurate geographical data.
    polylinePoints: const [
      // Starting in Pampang Road
      //Starting Point
      
      //Ending Point
      
    ],
  ),


  JeepneyRoute(
    id: 'friendship',
    name: 'Friendship Highway - Angeles',
    color: const Color.fromARGB(255, 225, 172, 125),
    startingPoint: ' ',

    /// The list of [LatLng] points for this route's path.
    /// This route currently has no points and needs to be populated
    /// with accurate geographical data.
    polylinePoints: const [
      // Starting in Pampang Road
      //Starting Point
      
      //Ending Point
      
    ],
  ),
];
