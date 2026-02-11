import 'package:flutter/material.dart';
import 'payment_screen.dart';

class QrScannerScreen extends StatelessWidget {
  const QrScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Scan QR'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),

          Container(
            height: 280,
            width: 280,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Icon(
                Icons.qr_code_scanner,
                size: 120,
                color: Colors.green,
              ),
            ),
          ),

          const SizedBox(height: 30),

          const Text(
            'Align QR inside the frame',
            style: TextStyle(color: Colors.white70),
          ),

          const Spacer(),

          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                // Fake scan result
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PaymentScreen(
                      vendorName: 'Bus No. 12',
                      amount: 25,
                    ),
                  ),
                );
              },
              child: const Text('Simulate Scan'),
            ),
          ),
        ],
      ),
    );
  }
}
