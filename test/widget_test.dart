import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:sakay_ph/screens/jeepney_map_page.dart';
import 'package:sakay_ph/features/routes_list/view_models/route_selection_view_model.dart';

void main() {
  // A group for widget tests related to the app's initial startup.
  group('App Startup Test', () {
    // This test ensures that the main application can be rendered
    // without any errors.
    testWidgets('App starts without crashing', (WidgetTester tester) async {
      // Build the app's main widget tree with the provider.
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => RouteSelectionViewModel(),
          child: const MaterialApp(home: JeepneyMapPage()),
        ),
      );
      await tester.pumpAndSettle();
      // Verify that the JeepneyMapPage is found, indicating a successful render.
      expect(find.byType(JeepneyMapPage), findsOneWidget);
    });
  });
}
