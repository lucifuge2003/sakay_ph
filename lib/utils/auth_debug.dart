import 'package:flutter/material.dart';
import '../services/auth_service.dart';

/// Debug utilities for authentication testing
class AuthDebug {
  /// Test the complete signup and login flow
  static Future<void> testAuthFlow({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      debugPrint('Testing Auth Flow for: $email');
      
      // Step 1: Test signup
      debugPrint('Step 1: Testing signup...');
      final signupResponse = await AuthService.signUp(
        email: email,
        password: password,
        fullName: fullName,
      );
      
      if (signupResponse.user != null) {
        debugPrint('Signup successful: ${signupResponse.user!.email}');
        debugPrint('   User ID: ${signupResponse.user!.id}');
        debugPrint('   Session: ${signupResponse.session != null ? "Created" : "Not created"}');
      } else {
        debugPrint('Signup failed: No user returned');
        return;
      }

      // Step 2: Sign out to test login
      if (signupResponse.session != null) {
        debugPrint('Signing out to test login...');
        await AuthService.signOut();
        debugPrint('Signed out successfully');
      }

      // Step 3: Test login
      debugPrint('Step 2: Testing login...');
      final loginResponse = await AuthService.signIn(
        email: email,
        password: password,
      );
      
      if (loginResponse.user != null && loginResponse.session != null) {
        debugPrint('Login successful: ${loginResponse.user!.email}');
        debugPrint('   User ID: ${loginResponse.user!.id}');
        debugPrint('   Session: Created');
        debugPrint('Auth flow test completed successfully!');
      } else {
        debugPrint('Login failed: ${loginResponse.user != null ? "User exists but no session" : "No user"}');
      }

      // Clean up
      await AuthService.signOut();
      debugPrint('Cleaned up test session');
      
    } catch (e) {
      debugPrint('Auth flow test failed: $e');
    }
  }

  /// Test credentials without affecting current session
  static Future<bool> testCredentials({
    required String email,
    required String password,
  }) async {
    try {
      debugPrint('Testing credentials for: $email');
      final result = await AuthService.testCredentials(
        email: email,
        password: password,
      );
      debugPrint(result ? 'Credentials valid' : 'Credentials invalid');
      return result;
    } catch (e) {
      debugPrint('Credential test failed: $e');
      return false;
    }
  }

  /// Show current auth state
  static void showAuthState() {
    final user = AuthService.currentUser;
    final isSignedIn = AuthService.isSignedIn;
    
    debugPrint('Current Auth State:');
    debugPrint('   Signed in: $isSignedIn');
    if (user != null) {
      debugPrint('   User email: ${user.email}');
      debugPrint('   User ID: ${user.id}');
      debugPrint('   Email confirmed: ${user.emailConfirmedAt != null}');
      debugPrint('   Created at: ${user.createdAt}');
    } else {
      debugPrint('   User: null');
    }
  }
}
