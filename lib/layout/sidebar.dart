import 'package:flutter/material.dart';
import '../core/app_role.dart';
import 'admin_page.dart';
import '../vendor/vendor_page.dart';

class Sidebar extends StatelessWidget {
  final AppRole role;

  final AdminPage? selectedAdminPage;
  final ValueChanged<AdminPage>? onAdminPageSelected;

  final VendorPage? selectedVendorPage;
  final ValueChanged<VendorPage>? onVendorPageSelected;

  const Sidebar({
    super.key,
    required this.role,
    this.selectedAdminPage,
    this.onAdminPageSelected,
    this.selectedVendorPage,
    this.onVendorPageSelected,
  });

  Widget _item(
    String title,
    IconData icon,
    bool selected,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      selected: selected,
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Column(
        children: [
          const SizedBox(height: 40),

          if (role == AppRole.admin) ...[
            _item(
              'Dashboard',
              Icons.dashboard,
              selectedAdminPage == AdminPage.dashboard,
              () => onAdminPageSelected?.call(AdminPage.dashboard),
            ),
            _item(
              'Users',
              Icons.people,
              selectedAdminPage == AdminPage.users,
              () => onAdminPageSelected?.call(AdminPage.users),
            ),
            _item(
              'Buses',
              Icons.directions_bus,
              selectedAdminPage == AdminPage.buses,
              () => onAdminPageSelected?.call(AdminPage.buses),
            ),
            _item(
              'Reports',
              Icons.bar_chart,
              selectedAdminPage == AdminPage.reports,
              () => onAdminPageSelected?.call(AdminPage.reports),
            ),
          ],

          if (role == AppRole.vendor) ...[
            _item(
              'Dashboard',
              Icons.dashboard,
              selectedVendorPage == VendorPage.dashboard,
              () => onVendorPageSelected?.call(VendorPage.dashboard),
            ),
            _item(
              'Trips',
              Icons.route,
              selectedVendorPage == VendorPage.trips,
              () => onVendorPageSelected?.call(VendorPage.trips),
            ),
            _item(
              'Earnings',
              Icons.bar_chart,
              selectedVendorPage == VendorPage.earnings,
              () => onVendorPageSelected?.call(VendorPage.earnings),
            ),
            _item(
              'Buses',
              Icons.directions_bus,
              selectedVendorPage == VendorPage.buses,
              () => onVendorPageSelected?.call(VendorPage.buses),
            ),
          ],
        ],
      ),
    );
  }
}
