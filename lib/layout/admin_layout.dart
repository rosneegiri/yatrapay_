import 'package:flutter/material.dart';
import 'sidebar.dart';
import 'admin_page.dart';

import '../dashboard/dashboard_screen.dart';
import '../buses/buses_routes_screen.dart';
import '../users/users_screen.dart';
import '../reports/reports_screen.dart';

class AdminLayout extends StatefulWidget {
  const AdminLayout({super.key});

  @override
  State<AdminLayout> createState() => _AdminLayoutState();
}

class _AdminLayoutState extends State<AdminLayout> {
  AdminPage _currentPage = AdminPage.dashboard;

  Widget _getPage() {
    switch (_currentPage) {
      case AdminPage.dashboard:
        return const DashboardScreen();
      case AdminPage.buses:
       return BusesRoutesScreen();
      case AdminPage.users:
        return const UsersScreen();
      case AdminPage.reports:
        return const ReportsScreen();
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
            selectedPage: _currentPage,
            onPageSelected: (page) {
              setState(() => _currentPage = page);
            },
          ),
          Expanded(
            child: _getPage(),
          ),
        ],
      ),
    );
  }
}
