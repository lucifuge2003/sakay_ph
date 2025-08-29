import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/routes_list/presentation/jeepney_map_page.dart';
import 'features/routes_list/view_models/route_selection_view_model.dart';

void main() {
  // Wrap the entire app in a ChangeNotifierProvider to make the
  // RouteSelectionViewModel available to all widgets below it.
  runApp(
    ChangeNotifierProvider(
      create: (context) => RouteSelectionViewModel(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Set the home property to your JeepneyMapPage, making it the
      // first screen the user sees when they open the app.
      home: JeepneyMapPage(),
    );
  }
}
