import 'package:flutter/foundation.dart';
import '../models/user_model.dart';
import '../services/user_service.dart';

class UserProvider with ChangeNotifier {
  final UserService _userService = UserService();
  
  List<User> _users = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<User> get users => _users;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchUsers() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _users = await _userService.getUsers();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<bool> createUser(Map<String, dynamic> userData) async {
    try {
      await _userService.createUser(userData);
      await fetchUsers();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> updateUser(int id, Map<String, dynamic> userData) async {
    try {
      await _userService.updateUser(id, userData);
      await fetchUsers();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> deleteUser(int id) async {
    try {
      await _userService.deleteUser(id);
      await fetchUsers();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }
}
