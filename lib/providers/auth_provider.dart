import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../models/core/app_role.dart';

class AuthProvider with ChangeNotifier {
    // Update Profile
    Future<bool> updateProfile({
      required String name,
      required String email,
      required String phone,
    }) async {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();
      try {
        final response = await _authService.updateProfile(
          name: name,
          email: email,
          phone: phone,
        );
        _userData = response['user'] ?? response['data'] ?? response;
        _isLoading = false;
        notifyListeners();
        return true;
      } catch (e) {
        _errorMessage = e.toString();
        _isLoading = false;
        notifyListeners();
        return false;
      }
    }

    // Fetch Profile
    Future<void> fetchProfile() async {
      try {
        final response = await _authService.fetchProfile();
        _userData = response['user'] ?? response['data'] ?? response;
        notifyListeners();
      } catch (e) {
        // Optionally handle error
      }
    }
  final AuthService _authService = AuthService();
  
  bool _isLoggedIn = false;
  AppRole? _userRole;
  Map<String, dynamic>? _userData;
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoggedIn => _isLoggedIn;
  AppRole? get userRole => _userRole;
  Map<String, dynamic>? get userData => _userData;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Initialize - Check if already logged in
  Future<void> initialize() async {
    _isLoggedIn = await _authService.isLoggedIn();
    if (_isLoggedIn) {
      _userRole = await _authService.getCurrentRole();
    }
    notifyListeners();
  }

  // Login - Web (Admin/Vendor)
  Future<bool> loginWeb(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _authService.login(email, password);
      _userData = response['user'];
      
      final roleString = _userData?['role'];
      if (roleString == 'admin') {
        _userRole = AppRole.admin;
      } else if (roleString == 'vendor') {
        _userRole = AppRole.vendor;
      } else {
        throw Exception('Invalid role for web access');
      }
      
      _isLoggedIn = true;
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = e.toString().replaceFirst('Exception: ', '');
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Login - Mobile (User)
  Future<bool> loginMobile(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _authService.login(email, password);
      _userData = response['user'];
      _isLoggedIn = true;
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = e.toString().replaceFirst('Exception: ', '');
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Register - Mobile (User only)
  Future<bool> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _authService.register(
        name: name,
        email: email,
        password: password,
        phone: phone,
      );
      _userData = response['user'];
      _isLoggedIn = true;
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = e.toString().replaceFirst('Exception: ', '');
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Logout
  Future<void> logout() async {
    await _authService.logout();
    _isLoggedIn = false;
    _userRole = null;
    _userData = null;
    notifyListeners();
  }

  // Forgot Password
  Future<bool> forgotPassword(String email) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _authService.forgotPassword(email);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = e.toString().replaceFirst('Exception: ', '');
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Clear error
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
