import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/routes_list/presentation/jeepney_map_page.dart';
import 'features/routes_list/view_models/route_selection_view_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  // Wrap the entire app in a ChangeNotifierProvider to make the
  // RouteSelectionViewModel available to all widgets below it.
  runApp(
    ChangeNotifierProvider(
      create: (_) => RouteSelectionViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JeepneyMapPage(),
    );
  }
}
