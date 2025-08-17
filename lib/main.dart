import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sakay PH',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Text(
        'Routes List Page Placeholder',
      ), // temp placeholder for the actual home widget
    );
  }
}
