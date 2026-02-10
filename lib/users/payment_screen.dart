import 'package:flutter/material.dart';
import 'payment_success_screen.dart';

class PaymentScreen extends StatelessWidget {
  final String vendorName;
  final int amount;

  const PaymentScreen({
    super.key,
    required this.vendorName,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Pay To', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            Text(
              vendorName,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            const Text('Amount', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            Text(
              'NPR $amount',
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            const Spacer(),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const PaymentSuccessScreen(),
                  ),
                );
              },
              child: const Text('Pay with eSewa / Khalti'),
            ),
          ],
        ),
      ),
    );
  }
}
