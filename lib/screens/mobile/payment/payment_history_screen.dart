import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/payment_provider.dart';
import 'package:intl/intl.dart';

class PaymentHistoryScreen extends StatefulWidget {
  const PaymentHistoryScreen({super.key});

  @override
  State<PaymentHistoryScreen> createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> {
  @override
  void initState() {
    super.initState();
    _loadPayments();
  }

  Future<void> _loadPayments() async {
    final paymentProvider = Provider.of<PaymentProvider>(context, listen: false);
    await paymentProvider.fetchPaymentHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment History'),
      ),
      body: Consumer<PaymentProvider>(
        builder: (context, paymentProvider, child) {
          if (paymentProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (paymentProvider.paymentHistory.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.payment_outlined,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No payment history',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: _loadPayments,
            child: ListView.builder(
              itemCount: paymentProvider.paymentHistory.length,
              itemBuilder: (context, index) {
                final payment = paymentProvider.paymentHistory[index];
                final dateFormat = DateFormat('MMM dd, yyyy');
                final timeFormat = DateFormat('hh:mm a');
                
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: _getStatusColor(payment.status).withOpacity(0.1),
                      child: Icon(
                        _getStatusIcon(payment.status),
                        color: _getStatusColor(payment.status),
                      ),
                    ),
                    title: Text(
                      'Rs. ${payment.amount.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(payment.paymentMethod.toUpperCase()),
                        const SizedBox(height: 4),
                        Text(
                          payment.createdAt != null
                              ? '${dateFormat.format(payment.createdAt!)} at ${timeFormat.format(payment.createdAt!)}'
                              : '',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    trailing: Chip(
                      label: Text(
                        payment.status.toUpperCase(),
                        style: const TextStyle(fontSize: 12),
                      ),
                      backgroundColor: _getStatusColor(payment.status).withOpacity(0.1),
                      labelStyle: TextStyle(
                        color: _getStatusColor(payment.status),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
      case 'success':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'failed':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
      case 'success':
        return Icons.check_circle;
      case 'pending':
        return Icons.schedule;
      case 'failed':
        return Icons.cancel;
      default:
        return Icons.payment;
    }
  }
}
