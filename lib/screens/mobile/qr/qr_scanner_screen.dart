import 'package:flutter/material.dart';

class QrScannerScreen extends StatelessWidget {
  const QrScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Scan QR Code'),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Icon(
                  Icons.qr_code_scanner,
                  size: 100,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Position QR code within frame',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Implement QR scanning
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('QR scanning will be implemented with camera permission'),
                  ),
                );
              },
              icon: const Icon(Icons.camera),
              label: const Text('Start Scanning'),
            ),
          ],
        ),
      ),
    );
  }
}
