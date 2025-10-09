import 'package:supabase_flutter/supabase_flutter.dart';
import 'supabase_config.dart';

class AuthService {
  static final SupabaseClient _supabase = SupabaseConfig.client;

  /// Get the current user
  static User? get currentUser => _supabase.auth.currentUser;

  /// Check if user is signed in
  static bool get isSignedIn => currentUser != null;

  /// Sign up with email and password
  static Future<AuthResponse> signUp({
    required String email,
    required String password,
    String? fullName,
  }) async {
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          if (fullName != null) 'full_name': fullName,
        },
      );
      return response;
    } on AuthException catch (error) {
      throw Exception(error.message);
    } catch (error) {
      throw Exception('An unexpected error occurred: $error');
    }
  }

  /// Sign in with email and password
  static Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return response;
    } on AuthException catch (error) {
      throw Exception(error.message);
    } catch (error) {
      throw Exception('An unexpected error occurred: $error');
    }
  }

  /// Sign out
  static Future<void> signOut() async {
    try {
      await _supabase.auth.signOut();
    } catch (error) {
      throw Exception('Failed to sign out: $error');
    }
  }

  /// Reset password
  static Future<void> resetPassword(String email) async {
    try {
      await _supabase.auth.resetPasswordForEmail(email);
    } on AuthException catch (error) {
      throw Exception(error.message);
    } catch (error) {
      throw Exception('An unexpected error occurred: $error');
    }
  }

  /// Listen to auth state changes
  static Stream<AuthState> get authStateChanges => _supabase.auth.onAuthStateChange;
}
