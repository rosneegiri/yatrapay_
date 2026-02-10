import 'package:flutter/material.dart';
import '../core/app_role.dart';
import '../auth/auth_controller.dart';

// admin
import '../admin/admin_users_screen.dart';
import 'admin_page.dart';
import '../admin/dashboard_screen.dart';

// shared
import '../buses/buses_routes_screen.dart';
import '../reports/reports_screen.dart';

// vendor
import '../vendor/vendor_page.dart';
import '../vendor/vendor_trips_screen.dart';
import '../vendor/vendor_earnings_screen.dart';

// user
import '../users/user_home_screen.dart';

import 'sidebar.dart';

class AppLayout extends StatefulWidget {
  final AppRole role;

  const AppLayout({super.key, required this.role});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  AdminPage _adminPage = AdminPage.dashboard;
  VendorPage _vendorPage = VendorPage.dashboard;

  Widget _getPage() {
    if (widget.role == AppRole.admin) {
      switch (_adminPage) {
        case AdminPage.dashboard:
          return const DashboardScreen();
        case AdminPage.users:
          return const AdminUsersScreen();
        case AdminPage.buses:
          return BusesRoutesScreen();
        case AdminPage.reports:
          return const ReportsScreen();
      }
    }

    if (widget.role == AppRole.vendor) {
      switch (_vendorPage) {
        case VendorPage.dashboard:
          return const DashboardScreen();
        case VendorPage.trips:
          return const VendorTripsScreen();
        case VendorPage.earnings:
          return const VendorEarningsScreen();
        case VendorPage.buses:
          return BusesRoutesScreen();
      }
    }

    return const UserHomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    // 🔐 AUTH GUARD (RIGHT PLACE)
    if (!AuthController.isLoggedIn ||
        AuthController.role != widget.role) {
      return const Scaffold(
        body: Center(child: Text('Unauthorized')),
      );
    }

    return Scaffold(
      body: Row(
        children: [
          if (widget.role != AppRole.user)
            Sidebar(
              role: widget.role,
              selectedAdminPage:
                  widget.role == AppRole.admin ? _adminPage : null,
              onAdminPageSelected: widget.role == AppRole.admin
                  ? (page) => setState(() => _adminPage = page)
                  : null,
              selectedVendorPage:
                  widget.role == AppRole.vendor ? _vendorPage : null,
              onVendorPageSelected: widget.role == AppRole.vendor
                  ? (page) => setState(() => _vendorPage = page)
                  : null,
            ),
          Expanded(child: _getPage()),
        ],
      ),
    );
  }
}
