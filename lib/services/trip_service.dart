import '../core/network/api_client.dart';
import '../core/constants/api_constants.dart';
import '../models/trip_model.dart';

class TripService {
  final ApiClient _apiClient = ApiClient();

  // Get all trips
  Future<List<TripModel>> getTrips() async {
    try {
      final response = await _apiClient.get(ApiConstants.trips);
      // Laravel returns array directly, not wrapped in 'data'
      final List trips = response is List ? response : (response['data'] ?? response);
      return trips.map((json) => TripModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load trips: $e');
    }
  }

  // Get active trips (Mobile - User)
  Future<List<TripModel>> getActiveTrips() async {
    try {
      final response = await _apiClient.get(ApiConstants.activeTrips);
      // Laravel returns array directly, not wrapped in 'data'
      final List trips = response is List ? response : (response['data'] ?? response);
      return trips.map((json) => TripModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load active trips: $e');
    }
  }

  // Get trip history (Mobile - User)
  Future<List<TripModel>> getTripHistory() async {
    try {
      final response = await _apiClient.get(ApiConstants.tripHistory);
      final List trips = response['data'] ?? [];
      return trips.map((json) => TripModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load trip history: $e');
    }
  }

  // Get trip by ID
  Future<TripModel> getTrip(int id) async {
    try {
      final response = await _apiClient.get(ApiConstants.tripDetail(id));
      return TripModel.fromJson(response['data']);
    } catch (e) {
      throw Exception('Failed to load trip: $e');
    }
  }

  // Create trip
  Future<TripModel> createTrip(TripModel trip) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.trips,
        trip.toJson(),
      );
      return TripModel.fromJson(response['data']);
    } catch (e) {
      throw Exception('Failed to create trip: $e');
    }
  }
}
