import 'package:flutter/material.dart';
import '../models/trip_model.dart';
import '../services/trip_service.dart';

class TripProvider with ChangeNotifier {
  final TripService _tripService = TripService();
  
  List<TripModel> _trips = [];
  List<TripModel> _activeTrips = [];
  List<TripModel> _tripHistory = [];
  TripModel? _selectedTrip;
  bool _isLoading = false;
  String? _errorMessage;

  List<TripModel> get trips => _trips;
  List<TripModel> get activeTrips => _activeTrips;
  List<TripModel> get tripHistory => _tripHistory;
  TripModel? get selectedTrip => _selectedTrip;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Fetch all trips (Admin/Vendor)
  Future<void> fetchTrips() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _trips = await _tripService.getTrips();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Fetch active trips (Mobile - User)
  Future<void> fetchActiveTrips() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _activeTrips = await _tripService.getActiveTrips();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Fetch trip history (Mobile - User)
  Future<void> fetchTripHistory() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _tripHistory = await _tripService.getTripHistory();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Select trip
  void selectTrip(TripModel? trip) {
    _selectedTrip = trip;
    notifyListeners();
  }
}
