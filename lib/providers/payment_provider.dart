import 'package:flutter/material.dart';
import '../models/payment_model.dart';
import '../services/payment_service.dart';

class PaymentProvider with ChangeNotifier {
  final PaymentService _paymentService = PaymentService();
  
  List<PaymentModel> _payments = [];
  List<PaymentModel> _paymentHistory = [];
  PaymentModel? _selectedPayment;
  bool _isLoading = false;
  String? _errorMessage;

  List<PaymentModel> get payments => _payments;
  List<PaymentModel> get paymentHistory => _paymentHistory;
  PaymentModel? get selectedPayment => _selectedPayment;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Fetch payment history (Mobile - User)
  Future<void> fetchPaymentHistory() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _paymentHistory = await _paymentService.getPaymentHistory();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Fetch all payments (Admin/Vendor)
  Future<void> fetchAllPayments() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _payments = await _paymentService.getAllPayments();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Create payment
  Future<bool> createPayment(PaymentModel payment) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final newPayment = await _paymentService.createPayment(payment);
      _payments.add(newPayment);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Select payment
  void selectPayment(PaymentModel? payment) {
    _selectedPayment = payment;
    notifyListeners();
  }
}
