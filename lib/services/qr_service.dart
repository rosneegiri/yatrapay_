import '../core/network/api_client.dart';
import '../core/constants/api_constants.dart';
import '../models/qr_code_model.dart';

class QrService {
  final ApiClient _apiClient = ApiClient();

  // Check-in with QR code
  Future<Map<String, dynamic>> checkIn(String qrData) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.qrCheckIn,
        {'qr_data': qrData},
      );
      return response;
    } catch (e) {
      throw Exception('Check-in failed: $e');
    }
  }

  // Check-out with QR code
  Future<Map<String, dynamic>> checkOut(String qrData) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.qrCheckOut,
        {'qr_data': qrData},
      );
      return response;
    } catch (e) {
      throw Exception('Check-out failed: $e');
    }
  }

  // Validate QR code
  Future<QrCodeModel> validateQr(String qrData) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.qrValidate,
        {'qr_data': qrData},
      );
      return QrCodeModel.fromJson(response['data']);
    } catch (e) {
      throw Exception('QR validation failed: $e');
    }
  }
}
