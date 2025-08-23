import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sakay PH',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Text(
        'Hello World',
        // Ropero, Luiz Angelo T.
        // Arcuino, Shan Harvey
        // Gurango, Christine Francoise
        // Pamintuan, Alexia John
      ), // temp placeholder for the actual home widget
    );
  }
}
