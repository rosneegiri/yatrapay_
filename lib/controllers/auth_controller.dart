import '../models/core/app_role.dart';

class AuthController {
  static AppRole? _currentRole;
  static bool _isLoggedIn = false;

  static AppRole? get currentRole => _currentRole;
  static bool get isLoggedIn => _isLoggedIn;

  static Future<bool> login(String username, String password, AppRole role) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    
    // Simple validation for demo
    if (username.isNotEmpty && password.length >= 6) {
      _currentRole = role;
      _isLoggedIn = true;
      return true;
    }
    return false;
  }

  static void logout() {
    _currentRole = null;
    _isLoggedIn = false;
  }
}
