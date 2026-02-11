import 'package:flutter/foundation.dart';
import '../models/bus_model.dart';
import '../services/bus_service.dart';

class BusProvider with ChangeNotifier {
  final BusService _busService = BusService();
  
  List<Bus> _buses = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Bus> get buses => _buses;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchBuses() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _buses = await _busService.getBuses();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<bool> createBus(Map<String, dynamic> busData) async {
    try {
      await _busService.createBus(busData);
      await fetchBuses();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> updateBus(int id, Map<String, dynamic> busData) async {
    try {
      await _busService.updateBus(id, busData);
      await fetchBuses();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> deleteBus(int id) async {
    try {
      await _busService.deleteBus(id);
      await fetchBuses();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }
}
