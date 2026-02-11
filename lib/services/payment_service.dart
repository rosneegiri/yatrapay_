import '../core/network/api_client.dart';
import '../core/constants/api_constants.dart';
import '../models/payment_model.dart';

class PaymentService {
  final ApiClient _apiClient = ApiClient();

  // Get payment history
  Future<List<PaymentModel>> getPaymentHistory() async {
    try {
      final response = await _apiClient.get(ApiConstants.paymentHistory);
      final List payments = response['data'] ?? [];
      return payments.map((json) => PaymentModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load payment history: $e');
    }
  }

  // Get payment by ID
  Future<PaymentModel> getPayment(int id) async {
    try {
      final response = await _apiClient.get(ApiConstants.paymentDetail(id));
      return PaymentModel.fromJson(response['data']);
    } catch (e) {
      throw Exception('Failed to load payment: $e');
    }
  }

  // Create payment
  Future<PaymentModel> createPayment(PaymentModel payment) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.payments,
        payment.toJson(),
      );
      return PaymentModel.fromJson(response['data']);
    } catch (e) {
      throw Exception('Failed to create payment: $e');
    }
  }

  // Get all payments (Admin/Vendor)
  Future<List<PaymentModel>> getAllPayments() async {
    try {
      final response = await _apiClient.get(ApiConstants.payments);
      final List payments = response['data'] ?? [];
      return payments.map((json) => PaymentModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load payments: $e');
    }
  }
}
