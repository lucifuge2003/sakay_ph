import 'package:flutter/material.dart';
import 'login_page.dart';
import '../utils/page_transitions.dart';

class StartupPage extends StatelessWidget {
  const StartupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFF7D0), Color(0xFFFFFFFF), Color(0xFFC8AD7E)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 16.0,
            ),
            // START OF CHANGES: Replaced the layout logic for better spacing control
            child: Column(
              // Removed MainAxisAlignment.spaceBetween
              children: [
                // Top Section (Logo and Title)
                Column(
                  children: [
                    const SizedBox(height: 50),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 15,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/logo.png',
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      'Sake Na!',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30), // Added consistent spacing
                // Middle Section (Welcome Text) - No longer Expanded
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome to Sake Na!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Your smart guide to jeepney routes in Angeles City.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Find the fastest, easiest, and most convenient way to reach your destination—without the hassle.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),

                // This Spacer pushes the content below it to the bottom of the screen
                const Spacer(),

                // Bottom Section (Tagline and Button)
                Column(
                  children: [
                    const Text(
                      'Sakay na, Tara Na!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 20), // Controlled space
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(
                          bottom: 20,
                        ), // Reduced bottom margin
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              SlidePageRoute(
                                child: const LoginPage(),
                                direction: SlideDirection.rightToLeft,
                                duration: const Duration(milliseconds: 350),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF000000),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: const BorderSide(
                                color: Colors.black,
                                width: .5,
                              ),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Sakay Tayo',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
