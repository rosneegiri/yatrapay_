import 'package:flutter/material.dart';

class RecentTripsTable extends StatelessWidget {
  const RecentTripsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recent Trips',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          Expanded(
            child: SingleChildScrollView(
              child: DataTable(
                headingRowColor: MaterialStateProperty.all(
                  Colors.grey.shade100,
                ),
                columns: const [
                  DataColumn(label: Text('Bus ID')),
                  DataColumn(label: Text('Route')),
                  DataColumn(label: Text('Date')),
                  DataColumn(label: Text('Fare')),
                  DataColumn(label: Text('Payment')),
                ],
                rows: List.generate(
                  6,
                  (index) {
                    final isPaid = index % 2 == 0;
                    return DataRow(
                    onSelectChanged: (_) {}, 
                    cells: [
                      const DataCell(Text('BUS-12')),
                      const DataCell(Text('Bagar - Chauthe')),
                      const DataCell(Text('2025-02-08')),
                      const DataCell(Text('Rs. 120')),
                      DataCell(_statusChip(isPaid)),
                    ],
                  );


                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statusChip(bool isPaid) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isPaid ? Colors.green.shade100 : Colors.orange.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        isPaid ? 'Completed' : 'Pending',
        style: TextStyle(
          color: isPaid ? Colors.green.shade800 : Colors.orange.shade800,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
        ),
      ],
    );
  }
}
