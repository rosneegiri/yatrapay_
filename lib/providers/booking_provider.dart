import 'package:flutter/foundation.dart';
import '../models/booking/booking_model.dart';
import '../services/booking_service.dart';

class BookingProvider with ChangeNotifier {
  final BookingService _bookingService = BookingService();

  List<BookingModel> _bookings = [];
  BookingModel? _currentBooking;
  bool _isLoading = false;
  String? _errorMessage;
  String? _ticketQrCode;

  List<BookingModel> get bookings => _bookings;
  BookingModel? get currentBooking => _currentBooking;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String? get ticketQrCode => _ticketQrCode;

  // Get active bookings (not cancelled or completed)
  List<BookingModel> get activeBookings => _bookings
      .where((b) => b.status != 'cancelled' && b.status != 'completed')
      .toList();

  // Get past bookings (cancelled or completed)
  List<BookingModel> get pastBookings => _bookings
      .where((b) => b.status == 'cancelled' || b.status == 'completed')
      .toList();

  Future<void> fetchUserBookings() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _bookings = await _bookingService.getUserBookings();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<void> fetchBookingDetails(String bookingId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _currentBooking = await _bookingService.getBookingDetails(bookingId);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<bool> createBooking(Map<String, dynamic> bookingData) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _currentBooking = await _bookingService.createBooking(bookingData);
      await fetchUserBookings(); // Refresh bookings list
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> cancelBooking(String bookingId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _bookingService.cancelBooking(bookingId);
      await fetchUserBookings(); // Refresh bookings list
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<void> generateTicketQr(String bookingId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _ticketQrCode = await _bookingService.generateTicketQr(bookingId);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  void clearCurrentBooking() {
    _currentBooking = null;
    _ticketQrCode = null;
    notifyListeners();
  }
}
