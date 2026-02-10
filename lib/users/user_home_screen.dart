import 'package:flutter/material.dart';
import 'qr_scanner_screen.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YatraPay'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Scan QR
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => QrScannerScreen(),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: const [
                    Icon(
                      Icons.qr_code_scanner,
                      size: 60,
                      color: Colors.white,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Scan QR to Pay',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Recent Trips',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 12),

            Expanded(
              child: ListView(
                children: const [
                  TripCard(
                    route: 'Lakeside → Chipledhunga',
                    amount: 'NPR 25',
                    date: 'Today • 9:10 AM',
                  ),
                  TripCard(
                    route: 'Bagar → Prithvi Chowk',
                    amount: 'NPR 30',
                    date: 'Yesterday • 6:40 PM',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TripCard extends StatelessWidget {
  final String route;
  final String amount;
  final String date;

  const TripCard({
    super.key,
    required this.route,
    required this.amount,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.directions_bus, color: Colors.green),
        title: Text(route),
        subtitle: Text(date),
        trailing: Text(
          amount,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
