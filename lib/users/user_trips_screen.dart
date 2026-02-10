import 'package:flutter/material.dart';

class UserTripsScreen extends StatelessWidget {
  const UserTripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Trips'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          TripHistoryCard(
            route: 'Lakeside → Chipledhunga',
            amount: 'NPR 25',
            date: 'Today • 9:10 AM',
          ),
          TripHistoryCard(
            route: 'Bagar → Prithvi Chowk',
            amount: 'NPR 30',
            date: 'Yesterday • 6:40 PM',
          ),
          TripHistoryCard(
            route: 'Zero KM → Airport',
            amount: 'NPR 35',
            date: '22 Oct • 10:00 AM',
          ),
        ],
      ),
    );
  }
}

class TripHistoryCard extends StatelessWidget {
  final String route;
  final String amount;
  final String date;

  const TripHistoryCard({
    super.key,
    required this.route,
    required this.amount,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: const Icon(
          Icons.directions_bus,
          color: Colors.green,
        ),
        title: Text(route),
        subtitle: Text(date),
        trailing: Text(
          amount,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
