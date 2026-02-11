import '../core/network/api_client.dart';
import '../core/constants/api_constants.dart';
import '../models/core/app_role.dart';

class AuthService {
  final ApiClient _apiClient = ApiClient();

  // Login
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.login,
        {
          'email': email,
          'password': password,
        },
      );
      
      // Store token and role
      final token = response['token'] ?? response['access_token'];
      final role = response['user']['role'];
      
      if (token != null && role != null) {
        await _apiClient.setAuthData(token, role);
      }
      
      return response;
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  // Register (Mobile - Users only)
  Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.register,
        {
          'name': name,
          'email': email,
          'password': password,
          'phone': phone,
          'role': 'user',
        },
      );
      
      // Store token and role
      final token = response['token'] ?? response['access_token'];
      if (token != null) {
        await _apiClient.setAuthData(token, 'user');
      }
      
      return response;
    } catch (e) {
      throw Exception('Registration failed: $e');
    }
  }

  // Logout
  Future<void> logout() async {
    try {
      await _apiClient.post(ApiConstants.logout, {});
    } catch (e) {
      // Ignore error, clear local data anyway
    } finally {
      await _apiClient.clearAuthData();
    }
  }

  // Forgot Password
  Future<void> forgotPassword(String email) async {
    try {
      await _apiClient.post(
        ApiConstants.forgotPassword,
        {'email': email},
      );
    } catch (e) {
      throw Exception('Failed to send reset email: $e');
    }
  }

  // Get current user role
  Future<AppRole?> getCurrentRole() async {
    final roleString = await _apiClient.getUserRole();
    if (roleString == null) return null;
    
    switch (roleString.toLowerCase()) {
      case 'admin':
        return AppRole.admin;
      case 'vendor':
        return AppRole.vendor;
      default:
        return null;
    }
  }

  // Check if logged in
  Future<bool> isLoggedIn() async {
    return await _apiClient.isLoggedIn();
  }
}
