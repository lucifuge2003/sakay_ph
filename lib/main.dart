import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sakay_ph/features/routes_list/view_models/route_selection_view_model.dart';
import 'package:sakay_ph/screens/startup_page.dart';
import 'package:sakay_ph/screens/loading_page.dart';
import 'package:sakay_ph/screens/login_page.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sakay Angeles PH',
      theme: ThemeData(
        primaryColor: const Color(0xFFB89B6E),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFB89B6E)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoadingPage(),
        '/startup': (context) => const StartupPage(),
        '/login': (context) => const LoginPage(),
      },
    );
  }
}
