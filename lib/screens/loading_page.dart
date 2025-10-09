import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sakay_ph/screens/startup_page.dart';
import 'package:sakay_ph/screens/jeepney_map_page.dart';
import 'package:sakay_ph/services/auth_state_manager.dart';

/// Simple Loading/Splash screen with smooth transition to StartupPage
class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    _navigateToStartup();
  }

  Future<void> _navigateToStartup() async {
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      final authManager = context.read<AuthStateManager>();
      
      // Wait for auth state to be initialized
      while (!authManager.isInitialized && mounted) {
        await Future.delayed(const Duration(milliseconds: 100));
      }
      
      if (mounted) {
        // Navigate based on authentication state
        if (authManager.isSignedIn) {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 700),
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const JeepneyMapPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 700),
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const StartupPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/logo.png', width: 150, height: 150),
      ),
    );
  }
}
