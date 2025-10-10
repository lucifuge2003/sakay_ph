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
        emailRedirectTo: null, // Skip email confirmation
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

  /// Test if credentials are valid (for debugging)
  static Future<bool> testCredentials({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      
      // Sign out immediately after testing
      if (response.session != null) {
        await _supabase.auth.signOut();
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  /// Update user metadata
  static Future<UserResponse> updateUserMetadata(Map<String, dynamic> data) async {
    try {
      final response = await _supabase.auth.updateUser(
        UserAttributes(data: data),
      );
      return response;
    } on AuthException catch (error) {
      throw Exception(error.message);
    } catch (error) {
      throw Exception('An unexpected error occurred: $error');
    }
  }

  /// Get user by email (for debugging)
  static Future<User?> getUserByEmail(String email) async {
    try {
      final response = await _supabase.auth.admin.listUsers();
      for (final user in response) {
        if (user.email == email) {
          return user;
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
