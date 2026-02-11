import 'package:flutter/foundation.dart';
import '../models/route_model.dart';
import '../services/route_service.dart';

class RouteProvider with ChangeNotifier {
  final RouteService _routeService = RouteService();
  
  List<BusRoute> _routes = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<BusRoute> get routes => _routes;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchRoutes() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _routes = await _routeService.getRoutes();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<bool> createRoute(Map<String, dynamic> routeData) async {
    try {
      await _routeService.createRoute(routeData);
      await fetchRoutes();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> updateRoute(int id, Map<String, dynamic> routeData) async {
    try {
      await _routeService.updateRoute(id, routeData);
      await fetchRoutes();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> deleteRoute(int id) async {
    try {
      await _routeService.deleteRoute(id);
      await fetchRoutes();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }
}
