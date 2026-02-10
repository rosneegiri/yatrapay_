import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Reports',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),

          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: const [
                _ReportCard(
                  title: 'Total Revenue',
                  value: '₹ 1,25,000',
                  icon: Icons.currency_rupee,
                ),
                _ReportCard(
                  title: 'Total Trips',
                  value: '320',
                  icon: Icons.directions_bus,
                ),
                _ReportCard(
                  title: 'Active Vendors',
                  value: '12',
                  icon: Icons.store,
                ),
                _ReportCard(
                  title: 'Registered Users',
                  value: '1,540',
                  icon: Icons.people,
                ),
                _ReportCard(
                  title: 'Cancelled Trips',
                  value: '18',
                  icon: Icons.cancel,
                ),
                _ReportCard(
                  title: 'Pending Payments',
                  value: '₹ 9,500',
                  icon: Icons.pending_actions,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ReportCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _ReportCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            const SizedBox(height: 12),
            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
