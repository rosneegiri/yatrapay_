import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/constants/api_constants.dart';
import '../models/booking/booking_model.dart';
import '../core/network/api_client.dart';

class BookingService {
  final String baseUrl = ApiConstants.baseUrl;
  final ApiClient _apiClient = ApiClient();

  Future<List<BookingModel>> getUserBookings() async {
    final token = await _apiClient.getToken();
    if (token == null) throw Exception('Not authenticated');

    final response = await http.get(
      Uri.parse('$baseUrl/api/user/bookings'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List bookings = data['bookings'] ?? [];
      return bookings.map((json) => BookingModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load bookings');
    }
  }

  Future<BookingModel> getBookingDetails(String bookingId) async {
    final token = await _apiClient.getToken();
    if (token == null) throw Exception('Not authenticated');

    final response = await http.get(
      Uri.parse('$baseUrl/api/user/bookings/$bookingId'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return BookingModel.fromJson(data['booking']);
    } else {
      throw Exception('Failed to load booking details');
    }
  }

  Future<BookingModel> createBooking(Map<String, dynamic> bookingData) async {
    final token = await _apiClient.getToken();
    if (token == null) throw Exception('Not authenticated');

    final response = await http.post(
      Uri.parse('$baseUrl/api/user/bookings'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
      body: json.encode(bookingData),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      final data = json.decode(response.body);
      return BookingModel.fromJson(data['booking']);
    } else {
      final error = json.decode(response.body);
      throw Exception(error['message'] ?? 'Failed to create booking');
    }
  }

  Future<void> cancelBooking(String bookingId) async {
    final token = await _apiClient.getToken();
    if (token == null) throw Exception('Not authenticated');

    final response = await http.post(
      Uri.parse('$baseUrl/api/user/bookings/$bookingId/cancel'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      final error = json.decode(response.body);
      throw Exception(error['message'] ?? 'Failed to cancel booking');
    }
  }

  Future<String> generateTicketQr(String bookingId) async {
    final token = await _apiClient.getToken();
    if (token == null) throw Exception('Not authenticated');

    final response = await http.get(
      Uri.parse('$baseUrl/api/user/bookings/$bookingId/qr'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['qr_code'];
    } else {
      throw Exception('Failed to generate QR code');
    }
  }
}
