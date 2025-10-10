import 'dart:async';
import 'package:flutter/material.dart';

class JeepneyInfoDialog extends StatefulWidget {
  const JeepneyInfoDialog({Key? key}) : super(key: key);

  @override
  State<JeepneyInfoDialog> createState() => _JeepneyInfoDialogState();

  /// Static method to show the dialog
  static Future<void> show(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => const JeepneyInfoDialog(),
    );
  }
}

class _JeepneyInfoDialogState extends State<JeepneyInfoDialog> {
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    // Start a timer to fade out after 3 seconds
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _opacity = 0.0;
        });
        // Close the dialog after fade-out
        Timer(const Duration(milliseconds: 500), () {
          if (mounted) Navigator.of(context).pop();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent, // transparent overlay
      insetPadding: const EdgeInsets.all(20),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: _opacity,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.95),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.directions_bus,
                    size: 40,
                    color: Color(0xFFB89B6E),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(
                      Icons.close,
                      size: 28,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'How to Use the Map',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),

              // Instructions
              _instructionRow(
                icon: Icons.location_on,
                color: Colors.green,
                title: 'Set Start Location',
                description:
                'Tap on the map to mark your starting point (green marker).',
              ),
              const SizedBox(height: 12),
              _instructionRow(
                icon: Icons.flag,
                color: Colors.red,
                title: 'Set Destination',
                description:
                'Tap on the map again to mark your destination (red marker).',
              ),
              const SizedBox(height: 12),
              _instructionRow(
                icon: Icons.directions_bus,
                color: const Color(0xFFB89B6E),
                title: 'View Routes',
                description:
                'Matching jeepney routes will be displayed automatically.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _instructionRow({
    required IconData icon,
    required Color color,
    required String title,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
