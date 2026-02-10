import 'package:flutter/material.dart';

import 'sidebar.dart';
import 'admin_page.dart';
import '../vendor/vendor_page.dart';

import '../dashboard/dashboard_screen.dart';
import '../buses/buses_routes_screen.dart';
import '../users/user_page.dart';
import '../reports/reports_screen.dart';

import '../vendor/vendor_trips_screen.dart';
import '../vendor/vendor_earnings_screen.dart';

class AppLayout extends StatefulWidget {
  final bool isAdmin; // true = admin, false = vendor

  const AppLayout({
    super.key,
    required this.isAdmin,
  });

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  AdminPage _adminPage = AdminPage.dashboard;
  VendorPage _vendorPage = VendorPage.dashboard;


  Widget _getPage() {
    if (widget.isAdmin) {
      switch (_adminPage) {
        case AdminPage.users:
          return const UserPage();
        case AdminPage.buses:
          return BusesRoutesScreen();
        case AdminPage.reports:
          return const ReportsScreen();
        case AdminPage.dashboard:
        default:
          return const DashboardScreen();
      }
    } else {
      switch (_vendorPage) {
        case VendorPage.trips:
          return const VendorTripsScreen();
        case VendorPage.earnings:
          return const VendorEarningsScreen();
        case VendorPage.buses:
          return BusesRoutesScreen();
        case VendorPage.dashboard:
        default:
          return const DashboardScreen();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Sidebar(
            selectedAdminPage: widget.isAdmin ? _adminPage : null,
            onAdminPageSelected: widget.isAdmin
                ? (page) => setState(() => _adminPage = page)
                : null,

            selectedVendorPage: !widget.isAdmin ? _vendorPage : null,
            onVendorPageSelected: !widget.isAdmin
                ? (page) => setState(() => _vendorPage = page)
                : null,
          ),
          Expanded(
            child: _getPage(),
          ),
        ],
      ),
    );
  }
}
