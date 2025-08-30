import 'package:flutter/material.dart';

class JeepneySearchBar extends StatelessWidget {
  const JeepneySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFE5D5B8), Color(0xFFB89B6E)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(color: Colors.black, width: 1.0),
        boxShadow: const [
          BoxShadow(
            color: Color(0x4D000000),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: const TextField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: Icon(Icons.search, color: Color(0xFF6A573F), size: 24.0),
          hintText: 'Search here...',
          hintStyle: TextStyle(
            color: Color(0xFFE5D5B8),
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
          ),
        ),
        style: TextStyle(
          color: Color(0xFF6A573F),
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
