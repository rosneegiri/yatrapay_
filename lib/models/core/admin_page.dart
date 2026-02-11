/// Admin application pages/screens
enum AdminPage {
  dashboard,
  users,
  trips,
  buses,
  reports,
}

extension AdminPageExtension on AdminPage {
  String get displayName {
    switch (this) {
      case AdminPage.dashboard:
        return 'Dashboard';
      case AdminPage.users:
        return 'Users';
      case AdminPage.trips:
        return 'Trips';
      case AdminPage.buses:
        return 'Buses';
      case AdminPage.reports:
        return 'Reports';
    }
  }

  String get route {
    switch (this) {
      case AdminPage.dashboard:
        return '/admin/dashboard';
      case AdminPage.users:
        return '/admin/users';
      case AdminPage.trips:
        return '/admin/trips';
      case AdminPage.buses:
        return '/admin/buses';
      case AdminPage.reports:
        return '/admin/reports';
    }
  }
}
