import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static const String _supabaseUrl = 'https://zocptdnedvyssdxmbzhq.supabase.co';
  static const String _supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpvY3B0ZG5lZHZ5c3NkeG1iemhxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjAwMTM3ODUsImV4cCI6MjA3NTU4OTc4NX0.rgUKlFOTE540DLbTuUPEerWIF1meTVBXlJ20_NGcFXo';

  /// Initialize Supabase with the project configuration
  static Future<void> initialize() async {
    await Supabase.initialize(
      url: _supabaseUrl,
      anonKey: _supabaseAnonKey,
      authOptions: const FlutterAuthClientOptions(
        authFlowType: AuthFlowType.pkce,
      ),
    );
  }

  /// Get the current Supabase client instance
  static SupabaseClient get client => Supabase.instance.client;
}
