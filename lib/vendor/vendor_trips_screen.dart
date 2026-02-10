import 'package:flutter/material.dart';

class VendorTripsScreen extends StatelessWidget {
  const VendorTripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Trips',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),

          Expanded(
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  headingRowHeight: 56,
                  columns: const [
                    DataColumn(label: Text('Trip ID')),
                    DataColumn(label: Text('Route')),
                    DataColumn(label: Text('Bus No')),
                    DataColumn(label: Text('Date')),
                    DataColumn(label: Text('Passengers')),
                    DataColumn(label: Text('Revenue')),
                    DataColumn(label: Text('Status')),
                  ],
                  rows: [
                    _TripRow(
                      id: 'PKR-001',
                      route: 'Prithvi Chowk → Lakeside',
                      bus: 'GA 1 KHA 2345',
                      date: '2026-02-01',
                      passengers: 38,
                      revenue: '₹ 7,600',
                      status: 'Completed',
                    ),
                    _TripRow(
                      id: 'PKR-002',
                      route: 'Bagar → Mahendrapool',
                      bus: 'GA 1 KHA 6789',
                      date: '2026-02-02',
                      passengers: 42,
                      revenue: '₹ 8,400',
                      status: 'Completed',
                    ),
                    _TripRow(
                      id: 'PKR-003',
                      route: 'Airport → Prithvi Chowk',
                      bus: 'GA 1 KHA 1122',
                      date: '2026-02-03',
                      passengers: 0,
                      revenue: '₹ 0',
                      status: 'Cancelled',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TripRow extends DataRow {
  _TripRow({
    required String id,
    required String route,
    required String bus,
    required String date,
    required int passengers,
    required String revenue,
    required String status,
  }) : super(
          cells: [
            DataCell(Text(id)),
            DataCell(Text(route)),
            DataCell(Text(bus)),
            DataCell(Text(date)),
            DataCell(Text(passengers.toString())),
            DataCell(Text(revenue)),
            DataCell(
              Text(
                status,
                style: TextStyle(
                  color: status == 'Completed'
                      ? Colors.green
                      : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
}
