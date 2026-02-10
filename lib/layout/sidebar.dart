import 'package:flutter/material.dart';
import 'admin_page.dart';
import '../vendor/vendor_page.dart';

class Sidebar extends StatelessWidget {
  final AdminPage? selectedAdminPage;
  final Function(AdminPage)? onAdminPageSelected;

  final VendorPage? selectedVendorPage;
  final Function(VendorPage)? onVendorPageSelected;

  const Sidebar({
    super.key,
    this.selectedAdminPage,
    this.onAdminPageSelected,
    this.selectedVendorPage,
    this.onVendorPageSelected,
  });

  @override
  Widget build(BuildContext context) {
    final bool isAdmin = selectedAdminPage != null;

    return Container(
      width: 260,
      color: Colors.grey.shade100,
      child: Column(
        children: [
          const SizedBox(height: 40),
          const Text(
            'YatraPay',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),

          if (isAdmin) ..._adminItems() else ..._vendorItems(),
        ],
      ),
    );
  }

  List<Widget> _adminItems() {
    return [
      _item('Dashboard', Icons.dashboard, AdminPage.dashboard,
          selectedAdminPage == AdminPage.dashboard,
          () => onAdminPageSelected?.call(AdminPage.dashboard)),
      _item('Buses', Icons.directions_bus, AdminPage.buses,
          selectedAdminPage == AdminPage.buses,
          () => onAdminPageSelected?.call(AdminPage.buses)),
      _item('Users', Icons.people, AdminPage.users,
          selectedAdminPage == AdminPage.users,
          () => onAdminPageSelected?.call(AdminPage.users)),
      _item('Reports', Icons.bar_chart, AdminPage.reports,
          selectedAdminPage == AdminPage.reports,
          () => onAdminPageSelected?.call(AdminPage.reports)),
    ];
  }

  List<Widget> _vendorItems() {
    return [
      _item('Dashboard', Icons.dashboard, VendorPage.dashboard,
          selectedVendorPage == VendorPage.dashboard,
          () => onVendorPageSelected?.call(VendorPage.dashboard)),
      _item('Buses', Icons.directions_bus, VendorPage.buses,
          selectedVendorPage == VendorPage.buses,
          () => onVendorPageSelected?.call(VendorPage.buses)),
      _item('Trips', Icons.route, VendorPage.trips,
          selectedVendorPage == VendorPage.trips,
          () => onVendorPageSelected?.call(VendorPage.trips)),
      _item('Earnings', Icons.bar_chart, VendorPage.earnings,
          selectedVendorPage == VendorPage.earnings,
          () => onVendorPageSelected?.call(VendorPage.earnings)),
    ];
  }

  Widget _item(
    String title,
    IconData icon,
    Object page,
    bool selected,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(icon, color: selected ? Colors.blue : Colors.black54),
      title: Text(
        title,
        style: TextStyle(
          color: selected ? Colors.blue : Colors.black87,
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: selected,
      onTap: onTap,
    );
  }
}
