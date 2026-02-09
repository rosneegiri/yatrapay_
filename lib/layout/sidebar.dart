import 'package:flutter/material.dart';
import 'admin_page.dart';
import 'widgets/hover_card.dart';

class Sidebar extends StatelessWidget {
  final AdminPage selectedPage;
  final ValueChanged<AdminPage> onPageSelected;

  const Sidebar({
    super.key,
    required this.selectedPage,
    required this.onPageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Yatrapa Admin',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 32),

          _SidebarItem(
            icon: Icons.dashboard,
            title: 'Dashboard',
            page: AdminPage.dashboard,
            selectedPage: selectedPage,
            onTap: onPageSelected,
          ),
          _SidebarItem(
            icon: Icons.directions_bus,
            title: 'Buses & Routes',
            page: AdminPage.buses,
            selectedPage: selectedPage,
            onTap: onPageSelected,
          ),
          _SidebarItem(
            icon: Icons.people,
            title: 'Users',
            page: AdminPage.users,
            selectedPage: selectedPage,
            onTap: onPageSelected,
          ),
          _SidebarItem(
            icon: Icons.bar_chart,
            title: 'Reports',
            page: AdminPage.reports,
            selectedPage: selectedPage,
            onTap: onPageSelected,
          ),

          const Spacer(),

          _SidebarItem(
            icon: Icons.settings,
            title: 'Settings',
            page: AdminPage.settings,
            selectedPage: selectedPage,
            onTap: onPageSelected,
          ),
        ],
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final AdminPage page;
  final AdminPage selectedPage;
  final ValueChanged<AdminPage> onTap;

  const _SidebarItem({
    required this.icon,
    required this.title,
    required this.page,
    required this.selectedPage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool selected = page == selectedPage;

    return GestureDetector(
      onTap: () => onTap(page),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: selected ? Colors.blue.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: selected ? Colors.blue : Colors.grey,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                color: selected ? Colors.blue : Colors.grey[700],
                fontWeight:
                    selected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
