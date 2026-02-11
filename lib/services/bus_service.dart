import '../core/network/api_client.dart';
import '../core/constants/api_constants.dart';
import '../models/bus_model.dart';

class BusService {
  final ApiClient _apiClient = ApiClient();

  Future<List<Bus>> getBuses() async {
    final response = await _apiClient.get(ApiConstants.getBuses);
    final List<dynamic> data = response['data'] ?? [];
    return data.map((json) => Bus.fromJson(json)).toList();
  }

  Future<Bus> getBus(int id) async {
    final response = await _apiClient.get('${ApiConstants.getBuses}/$id');
    return Bus.fromJson(response['data']);
  }

  Future<void> createBus(Map<String, dynamic> busData) async {
    await _apiClient.post(ApiConstants.createBus, busData);
  }

  Future<void> updateBus(int id, Map<String, dynamic> busData) async {
    await _apiClient.put('${ApiConstants.updateBus}/$id', busData);
  }

  Future<void> deleteBus(int id) async {
    await _apiClient.delete('${ApiConstants.deleteBus}/$id');
  }
}
