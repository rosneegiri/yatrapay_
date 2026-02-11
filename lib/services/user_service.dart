import '../core/network/api_client.dart';
import '../core/constants/api_constants.dart';
import '../models/user_model.dart';

class UserService {
  final ApiClient _apiClient = ApiClient();

  Future<List<User>> getUsers() async {
    final response = await _apiClient.get(ApiConstants.getUsers);
    final List<dynamic> data = response['data'] ?? [];
    return data.map((json) => User.fromJson(json)).toList();
  }

  Future<User> getUser(int id) async {
    final response = await _apiClient.get('${ApiConstants.getUsers}/$id');
    return User.fromJson(response['data']);
  }

  Future<void> createUser(Map<String, dynamic> userData) async {
    await _apiClient.post(ApiConstants.createUser, userData);
  }

  Future<void> updateUser(int id, Map<String, dynamic> userData) async {
    await _apiClient.put('${ApiConstants.updateUser}/$id', userData);
  }

  Future<void> deleteUser(int id) async {
    await _apiClient.delete('${ApiConstants.deleteUser}/$id');
  }
}
