import '../core/network/api_client.dart';
import '../core/constants/api_constants.dart';
import '../models/core/app_role.dart';

class AuthService {
    // Update Profile
    Future<Map<String, dynamic>> updateProfile({
      required String name,
      required String email,
      required String phone,
    }) async {
      try {
        final response = await _apiClient.put(
          ApiConstants.profile,
          {
            'name': name,
            'email': email,
            'phone': phone,
          },
        );
        return response;
      } catch (e) {
        throw Exception('Failed to update profile: $e');
      }
    }

    // Fetch Profile
    Future<Map<String, dynamic>> fetchProfile() async {
      try {
        final response = await _apiClient.get(ApiConstants.profile);
        return response;
      } catch (e) {
        throw Exception('Failed to fetch profile: $e');
      }
    }
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
      
      // Store token, role, and user data
      final token = response['token'] ?? response['access_token'];
      final userData = response['user'];
      final role = userData['role'];
      
      if (token != null && role != null) {
        await _apiClient.setAuthData(token, role, userData: userData);
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
      
      // Store token, role, and user data
      final token = response['token'] ?? response['access_token'];
      final userData = response['user'];
      if (token != null && userData != null) {
        await _apiClient.setAuthData(token, 'user', userData: userData);
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
