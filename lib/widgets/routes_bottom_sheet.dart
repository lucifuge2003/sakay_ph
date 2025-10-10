import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:sakay_ph/features/routes_list/data/initial_data/initial_jeepney_routes.dart';
import 'package:sakay_ph/features/routes_list/view_models/route_selection_view_model.dart';
import 'package:sakay_ph/features/routes_list/data/models/jeepney_route.dart';
import 'package:sakay_ph/features/routes_list/data/presentation/jeepney_map_page.dart';

class JeepneyRoutesBottomSheet extends StatelessWidget {
  const JeepneyRoutesBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<RouteSelectionViewModel>(context);

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Color(0xFFE5D5B8),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 5,
            width: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFC8AD7E),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Select a Jeepney Route',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color(0xFFC8AD7E),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: initialJeepneyRoutes.length,
              itemBuilder: (context, index) {
                final route = initialJeepneyRoutes[index];
                return _buildRouteCard(context, route, viewModel);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRouteCard(
      BuildContext context,
      JeepneyRoute route,
      RouteSelectionViewModel viewModel,
      ) {
    Color cardColor;
    switch (route.id) {
      case 'checkpoint-holy-loop':
        cardColor = const Color(0xFFB886D3);
        break;
      case 'marisol-pampang':
        cardColor = const Color(0xFF50C878);
        break;
      case 'Villa-Pampang':
        cardColor = const Color(0xFFE1E64C);
        break;
      case 'capaya':
        cardColor = const Color.fromARGB(255, 203, 71, 141);
        break;
      case 'sapangbato':
        cardColor = const Color.fromARGB(255, 203, 71, 71);
        break;
      case 'carmenville':
        cardColor = const Color.fromARGB(255, 235, 120, 25);
        break;
      case 'pandan':
        cardColor = const Color.fromARGB(255, 25, 137, 235);
        break;
      case 'checkpoint-balibago':
        cardColor = const Color.fromARGB(255, 87, 79, 84);
        break;
      case 'hensonville':
        cardColor = const Color.fromARGB(255, 235, 232, 233);
        break;
      default:
        cardColor = const Color.fromARGB(255, 225, 172, 125);
    }

    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: cardColor,
      child: ListTile(
        leading: const Icon(Icons.directions_bus, color: Color(0xFFC8AD7E)),
        title: Text(
          route.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: const Text(
          'Tap for details',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          viewModel.setSelectedRoute(route.id);
          _showRouteDetails(context, route);
        },
      ),
    );
  }

  void _showRouteDetails(BuildContext context, JeepneyRoute route) {
    final FlutterTts flutterTts = FlutterTts();

    final Map<String, Map<String, String>> routeInfo = {
      'checkpoint-holy-loop': {
        'desc':
        'This route connects Checkpoint to Holy Angel University. It passes Nepo Quad and Angeles City Hall.',
        'drops': 'Holy Angel University, Nepo Mart, Checkpoint'
      },
      'marisol-pampang': {
        'desc':
        'Runs between Marisol and Pampang, serving residential and public market areas.',
        'drops': 'Marisol, Pampang Terminal, Angeles City Proper'
      },
      'Villa-Pampang': {
        'desc':
        'Connects Villa Angela subdivision to Pampang. Popular among commuters heading to local schools.',
        'drops': 'Villa Angela, Pampang Market, Pandan Road'
      },
      'capaya': {
        'desc':
        'Capaya route services Capaya and nearby barangays, connecting them to downtown Angeles.',
        'drops': 'Capaya, Holy Family Academy, Angeles City Hall'
      },
      'sapangbato': {
        'desc':
        'Sapangbato route travels from downtown to the Sapangbato area near Clark Freeport.',
        'drops': 'Sapangbato, Friendship, Checkpoint'
      },
      'carmenville': {
        'desc':
        'Carmenville route covers major residential zones with access to Clark area and Nepo Center.',
        'drops': 'Carmenville, Nepo Center, Marquee Mall'
      },
      'pandan': {
        'desc':
        'Pandan jeepneys travel from the northern side of Angeles City to the market area.',
        'drops': 'Pandan, Nepo Mart, Angeles City Hall'
      },
      'checkpoint-balibago': {
        'desc':
        'Main line between Checkpoint and Balibago, covering nightlife and commercial zones.',
        'drops': 'Balibago, Walking Street, Checkpoint'
      },
      'hensonville': {
        'desc':
        'Hensonville route serves residential neighborhoods leading to major shopping centers.',
        'drops': 'Hensonville, SM Clark, Angeles City Proper'
      },
      'mining': {
        'desc':
        'Covers the Mining district and nearby barangays, connecting to Checkpoint and downtown.',
        'drops': 'Mining, Checkpoint, Holy Rosary Parish'
      },
    };


    final details = routeInfo[route.id] ?? {
      'desc': 'No detailed information available for this route.',
      'drops': 'N/A'
    };

    void _speak() async {
      await flutterTts.setLanguage("en-US");
      await flutterTts.setSpeechRate(0.6);
      await flutterTts.speak(
          "${route.name}. ${details['desc']}. Popular drop points include ${details['drops']}.");
    }

    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: const Color(0xFFE5D5B8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      route.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xFF725C3A),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: _speak,
                    icon: const Icon(Icons.volume_up, color: Colors.brown),
                    tooltip: 'Read aloud',
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(details['desc']!, style: const TextStyle(fontSize: 15)),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.brown, size: 20),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      "Popular Drop Points: ${details['drops']!}",
                      style: const TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC8AD7E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Close', style: TextStyle(color: Colors.white)),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF50C878),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context); // Close dialog
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => JeepneyMapPage(routeId: route.id),
                        ),
                      );
                    },
                    child: const Text('View Map', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
