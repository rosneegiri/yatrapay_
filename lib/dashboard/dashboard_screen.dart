import 'package:flutter/material.dart';
import 'stat_card.dart';
import 'booking_chart.dart';
import 'recent_trips_table.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Dashboard',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),

          Row(
            children: const [
              Expanded(
                child: StatCard(
                  title: 'Total Trips',
                  value: '1,245',
                  icon: Icons.directions_bus,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: StatCard(
                  title: 'Total Users',
                  value: '820',
                  icon: Icons.people,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: StatCard(
                  title: 'Revenue',
                  value: 'Rs. 92,500',
                  icon: Icons.attach_money,
                ),
              ),
            ],
          ),

          const SizedBox(height: 32),
          const BookingChart(),
          const SizedBox(height: 32),

          Expanded(child: RecentTripsTable()), // ✅ works now
        ],
      ),
    );
  }
}
