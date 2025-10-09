import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'auth_service.dart';

/// Manages authentication state across the app
class AuthStateManager extends ChangeNotifier {
  User? _user;
  bool _isLoading = true;
  bool _isInitialized = false;

  User? get user => _user;
  bool get isSignedIn => _user != null;
  bool get isLoading => _isLoading;
  bool get isInitialized => _isInitialized;

  AuthStateManager() {
    _initialize();
  }

  /// Initialize the auth state manager
  Future<void> _initialize() async {
    try {
      _isLoading = true;
      notifyListeners();

      // Get the current user from Supabase
      _user = AuthService.currentUser;

      // Listen to auth state changes
      AuthService.authStateChanges.listen((data) {
        final AuthChangeEvent event = data.event;
        final Session? session = data.session;
        
        _user = session?.user;
        
        if (event == AuthChangeEvent.signedIn) {
          _onSignedIn(_user!);
        } else if (event == AuthChangeEvent.signedOut) {
          _onSignedOut();
        }
        
        notifyListeners();
      });

      _isInitialized = true;
    } catch (e) {
      debugPrint('Error initializing auth state: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Handle user sign in
  void _onSignedIn(User user) {
    _user = user;
    debugPrint('User signed in: ${user.email}');
  }

  /// Handle user sign out
  void _onSignedOut() {
    _user = null;
    debugPrint('User signed out');
  }

  /// Sign out the current user
  Future<void> signOut() async {
    try {
      await AuthService.signOut();
      _user = null;
      notifyListeners();
    } catch (e) {
      debugPrint('Error signing out: $e');
      rethrow;
    }
  }

  /// Refresh user data
  Future<void> refreshUser() async {
    try {
      _user = AuthService.currentUser;
      notifyListeners();
    } catch (e) {
      debugPrint('Error refreshing user: $e');
    }
  }

  /// Check if user email is verified (always true since we skip verification)
  bool get isEmailVerified => true;

  /// Get user display name
  String get displayName {
    if (_user?.userMetadata?['full_name'] != null) {
      return _user!.userMetadata!['full_name'];
    }
    return _user?.email?.split('@').first ?? 'User';
  }

  /// Get user email
  String? get userEmail => _user?.email;
}
