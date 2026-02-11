import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  factory ApiClient() => _instance;
  ApiClient._internal();

  String? _token;
  String? _userRole;

  // Set authentication data
  Future<void> setAuthData(String token, String role) async {
    _token = token;
    _userRole = role;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
    await prefs.setString('user_role', role);
  }

  // Get token
  Future<String?> getToken() async {
    if (_token != null) return _token;
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('auth_token');
    return _token;
  }

  // Get user role
  Future<String?> getUserRole() async {
    if (_userRole != null) return _userRole;
    final prefs = await SharedPreferences.getInstance();
    _userRole = prefs.getString('user_role');
    return _userRole;
  }

  // Check if logged in
  Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null;
  }

  // Clear authentication data (logout)
  Future<void> clearAuthData() async {
    _token = null;
    _userRole = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    await prefs.remove('user_role');
  }

  // Common headers
  Future<Map<String, String>> _getHeaders() async {
    final token = await getToken();
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  // GET request
  Future<Map<String, dynamic>> get(String url) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: await _getHeaders(),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  // POST request
  Future<Map<String, dynamic>> post(String url, Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: await _getHeaders(),
        body: json.encode(data),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  // PUT request
  Future<Map<String, dynamic>> put(String url, Map<String, dynamic> data) async {
    try {
      final response = await http.put(
        Uri.parse(url),
        headers: await _getHeaders(),
        body: json.encode(data),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  // DELETE request
  Future<Map<String, dynamic>> delete(String url) async {
    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: await _getHeaders(),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  // Handle response
  Map<String, dynamic> _handleResponse(http.Response response) {
    final statusCode = response.statusCode;
    
    if (statusCode >= 200 && statusCode < 300) {
      if (response.body.isEmpty) {
        return {'success': true};
      }
      return json.decode(response.body);
    } else if (statusCode == 401) {
      clearAuthData(); // Auto logout on unauthorized
      throw Exception('Unauthorized. Please login again.');
    } else if (statusCode == 404) {
      throw Exception('Resource not found');
    } else if (statusCode == 422) {
      try {
        final error = json.decode(response.body);
        // Handle validation errors
        if (error['errors'] != null) {
          final errors = error['errors'] as Map<String, dynamic>;
          final firstError = errors.values.first;
          if (firstError is List && firstError.isNotEmpty) {
            throw Exception(firstError[0]);
          }
        }
        throw Exception(error['message'] ?? 'Invalid credentials');
      } catch (e) {
        if (e.toString().contains('Exception:')) rethrow;
        throw Exception('Invalid credentials');
      }
    } else {
      try {
        final error = json.decode(response.body);
        throw Exception(error['message'] ?? 'Request failed');
      } catch (e) {
        if (e.toString().contains('Exception:')) rethrow;
        throw Exception('Server error. Please try again.');
      }
    }
  }
}
