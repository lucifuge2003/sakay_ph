import 'package:flutter_test/flutter_test.dart';

// Assuming your main app widget is in lib/main.dart and is named MyApp
// You may need to adjust this import path if your app's main widget is
// in a different file.
import 'package:sakay_ph/main.dart';

void main() {
  // A group for widget tests related to the app's initial startup.
  group('App Startup Test', () {
    // This test ensures that the main application widget can be rendered
    // without any errors.
    testWidgets('App starts without crashing', (WidgetTester tester) async {
      // Build the app's main widget.
      // The `tester.pumpWidget` function renders the widget in a test environment.
      // If there are no exceptions, the test passes.
      await tester.pumpWidget(const MyApp());

      // Since we just want to ensure it doesn't crash, we'll simply verify
      // that the main widget is found.
      expect(find.byType(MyApp), findsOneWidget);
    });
  });
}
