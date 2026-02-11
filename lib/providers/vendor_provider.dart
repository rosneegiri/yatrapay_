import 'package:flutter/foundation.dart';
import '../models/vendor_model.dart';
import '../services/vendor_service.dart';

class VendorProvider with ChangeNotifier {
  final VendorService _vendorService = VendorService();
  
  List<Vendor> _vendors = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Vendor> get vendors => _vendors;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchVendors() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _vendors = await _vendorService.getVendors();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<bool> createVendor(Map<String, dynamic> vendorData) async {
    try {
      await _vendorService.createVendor(vendorData);
      await fetchVendors();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> updateVendor(int id, Map<String, dynamic> vendorData) async {
    try {
      await _vendorService.updateVendor(id, vendorData);
      await fetchVendors();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> deleteVendor(int id) async {
    try {
      await _vendorService.deleteVendor(id);
      await fetchVendors();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }
}
