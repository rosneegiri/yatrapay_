import 'package:flutter/material.dart';
import 'sidebar.dart';
import '../vendor/vendor_page.dart';

import '../dashboard/dashboard_screen.dart';
import '../buses/buses_routes_screen.dart';

class VendorLayout extends StatefulWidget {
  const VendorLayout({super.key});

  @override
  State<VendorLayout> createState() => _VendorLayoutState();
}

class _VendorLayoutState extends State<VendorLayout> {
  VendorPage _currentPage = VendorPage.dashboard;

  Widget _getPage() {
    switch (_currentPage) {
      case VendorPage.buses:
        return BusesRoutesScreen();
      case VendorPage.trips:
        return const Center(child: Text('Vendor Trips'));
      case VendorPage.earnings:
        return const Center(child: Text('Vendor Earnings'));
      case VendorPage.dashboard:
      default:
        return const DashboardScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Sidebar(
            selectedVendorPage: _currentPage,
            onVendorPageSelected: (page) {
              setState(() => _currentPage = page as VendorPage);
            },
          ),
          Expanded(child: _getPage()),
        ],
      ),
    );
  }
}
