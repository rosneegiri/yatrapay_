class ApiConstants {
  // Base URL - Change this to your Laravel API URL
  // For Android Emulator, use 10.0.2.2 instead of localhost
  // For physical device, use your computer's IP address (e.g., http://192.168.1.100:8000/api)
  static const String baseUrl = 'http://192.168.18.81:8000/api';
  
  // Auth endpoints
  static const String login = '$baseUrl/login';
  static const String register = '$baseUrl/register';
  static const String logout = '$baseUrl/logout';
  static const String forgotPassword = '$baseUrl/forgot-password';
  static const String resetPassword = '$baseUrl/reset-password';
  
  // User endpoints
  static const String users = '$baseUrl/users';
  static const String getUsers = '$baseUrl/users';
  static const String createUser = '$baseUrl/users';
  static const String updateUser = '$baseUrl/users';
  static const String deleteUser = '$baseUrl/users';
  static String userDetail(int id) => '$baseUrl/users/$id';
  static const String profile = '$baseUrl/profile';
  
  // Vendor endpoints
  static const String vendors = '$baseUrl/vendors';
  static const String getVendors = '$baseUrl/vendors';
  static const String createVendor = '$baseUrl/vendors';
  static const String updateVendor = '$baseUrl/vendors';
  static const String deleteVendor = '$baseUrl/vendors';
  static String vendorDetail(int id) => '$baseUrl/vendors/$id';
  
  // Bus endpoints
  static const String buses = '$baseUrl/buses';
  static const String getBuses = '$baseUrl/buses';
  static const String createBus = '$baseUrl/buses';
  static const String updateBus = '$baseUrl/buses';
  static const String deleteBus = '$baseUrl/buses';
  static String busDetail(int id) => '$baseUrl/buses/$id';
  
  // Route endpoints
  static const String routes = '$baseUrl/routes';
  static const String getRoutes = '$baseUrl/routes';
  static const String createRoute = '$baseUrl/routes';
  static const String updateRoute = '$baseUrl/routes';
  static const String deleteRoute = '$baseUrl/routes';
  static String routeDetail(int id) => '$baseUrl/routes/$id';
  
  // Trip endpoints
  static const String trips = '$baseUrl/trips';
  static String tripDetail(int id) => '$baseUrl/trips/$id';
  static const String activeTrips = '$baseUrl/trips/active';
  static const String tripHistory = '$baseUrl/trips/history';
  
  // Payment endpoints
  static const String payments = '$baseUrl/payments';
  static String paymentDetail(int id) => '$baseUrl/payments/$id';
  static const String paymentHistory = '$baseUrl/payments/history';
  
  // QR Code endpoints
  static const String qrCheckIn = '$baseUrl/qr/check-in';
  static const String qrCheckOut = '$baseUrl/qr/check-out';
  static const String qrValidate = '$baseUrl/qr/validate';
  
  // Dashboard endpoints
  static const String adminDashboard = '$baseUrl/admin/dashboard';
  static const String vendorDashboard = '$baseUrl/vendor/dashboard';
  static const String userDashboard = '$baseUrl/user/dashboard';
}
