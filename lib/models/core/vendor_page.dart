/// Vendor application pages/screens
enum VendorPage {
  dashboard,
  trips,
  earnings,
  buses,
}

extension VendorPageExtension on VendorPage {
  String get displayName {
    switch (this) {
      case VendorPage.dashboard:
        return 'Dashboard';
      case VendorPage.trips:
        return 'Trips';
      case VendorPage.earnings:
        return 'Earnings';
      case VendorPage.buses:
        return 'Buses';
    }
  }

  String get route {
    switch (this) {
      case VendorPage.dashboard:
        return '/vendor/dashboard';
      case VendorPage.trips:
        return '/vendor/trips';
      case VendorPage.earnings:
        return '/vendor/earnings';
      case VendorPage.buses:
        return '/vendor/buses';
    }
  }
}
