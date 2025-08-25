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
      home: Scaffold(
        backgroundColor: const Color(0xFFC8AD7E),
        appBar: AppBar(
          backgroundColor: const Color(0xFFC8AD7E),
          title: const TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              hintStyle: TextStyle(color: Colors.white70),
            ),
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          color: const Color(0xFFC8AD7E), //background color
          child: const Text(
            'Hello World',
        // Ropero, Luiz Angelo T.
        // Arcuino, Shan Harvey
        // Gurango, Christine Francoise
        // Pamintuan, Alexia John
          ),
      ),
      ), // temp placeholder for the actual home widget
    );
  }
}
