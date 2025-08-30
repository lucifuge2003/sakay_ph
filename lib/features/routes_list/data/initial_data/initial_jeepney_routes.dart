import 'package:latlong2/latlong.dart';
import '../../data/models/jeepney_route.dart';

List<JeepneyRoute> initialJeepneyRoutes = [
  // Lavender Route: SM Clark - Friendship via Balibago
  JeepneyRoute(
    id: 'lavender-route-ac',
    name: 'SM Clark - Friendship',
    polylinePoints: [
      LatLng(15.1711, 120.5369), // SM City Clark
      LatLng(15.1764, 120.5422), // Clark Main Gate
      LatLng(15.1785, 120.5480), // Balibago
      LatLng(15.1798, 120.5511), // Friendship Gate
      LatLng(15.1850, 120.5600), // Friendship Intersection
    ],
  ),
  // Yellow Route: SM Clark - Sapang Bato
  JeepneyRoute(
    id: 'yellow-route-ac',
    name: 'SM Clark - Sapang Bato',
    polylinePoints: [
      LatLng(15.1711, 120.5369), // SM City Clark
      LatLng(15.1740, 120.5401), // Don Juico Avenue
      LatLng(15.1764, 120.5422), // Clark Main Gate
      LatLng(15.1780, 120.5395), // Angeles City Bypass Road
      LatLng(15.1750, 120.5280), // Fil-Am Friendship Highway
      LatLng(15.1850, 120.5285), // Sapang Bato
    ],
  ),
  // Green Route: Clark Main Gate - Pandan
  JeepneyRoute(
    id: 'green-route-ac',
    name: 'Main Gate - Pandan',
    polylinePoints: [
      LatLng(15.1764, 120.5422), // Clark Main Gate
      LatLng(15.1685, 120.5510), // MacArthur Highway
      LatLng(15.1601, 120.5615), // Pulung Maragul
      LatLng(15.1520, 120.5730), // Pandan
    ],
  ),
];
