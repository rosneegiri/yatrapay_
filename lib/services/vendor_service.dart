import '../core/network/api_client.dart';
import '../core/constants/api_constants.dart';
import '../models/vendor_model.dart';

class VendorService {
  final ApiClient _apiClient = ApiClient();

  Future<List<Vendor>> getVendors() async {
    final response = await _apiClient.get(ApiConstants.getVendors);
    final List<dynamic> data = response['data'] ?? [];
    return data.map((json) => Vendor.fromJson(json)).toList();
  }

  Future<Vendor> getVendor(int id) async {
    final response = await _apiClient.get('${ApiConstants.getVendors}/$id');
    return Vendor.fromJson(response['data']);
  }

  Future<void> createVendor(Map<String, dynamic> vendorData) async {
    await _apiClient.post(ApiConstants.createVendor, vendorData);
  }

  Future<void> updateVendor(int id, Map<String, dynamic> vendorData) async {
    await _apiClient.put('${ApiConstants.updateVendor}/$id', vendorData);
  }

  Future<void> deleteVendor(int id) async {
    await _apiClient.delete('${ApiConstants.deleteVendor}/$id');
  }
}
