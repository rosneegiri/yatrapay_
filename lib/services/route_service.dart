import '../core/network/api_client.dart';
import '../core/constants/api_constants.dart';
import '../models/route_model.dart';

class RouteService {
  final ApiClient _apiClient = ApiClient();

  Future<List<BusRoute>> getRoutes() async {
    final response = await _apiClient.get(ApiConstants.getRoutes);
    // Laravel returns array directly, not wrapped in 'data'
    final List<dynamic> data = response is List ? response : (response['data'] ?? response);
    return data.map((json) => BusRoute.fromJson(json)).toList();
  }

  Future<BusRoute> getRoute(int id) async {
    final response = await _apiClient.get('${ApiConstants.getRoutes}/$id');
    return BusRoute.fromJson(response['data']);
  }

  Future<void> createRoute(Map<String, dynamic> routeData) async {
    await _apiClient.post(ApiConstants.createRoute, routeData);
  }

  Future<void> updateRoute(int id, Map<String, dynamic> routeData) async {
    await _apiClient.put('${ApiConstants.updateRoute}/$id', routeData);
  }

  Future<void> deleteRoute(int id) async {
    await _apiClient.delete('${ApiConstants.deleteRoute}/$id');
  }
}
