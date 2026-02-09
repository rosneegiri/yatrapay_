import 'package:flutter/material.dart';

class BusesRoutesScreen extends StatelessWidget {
  BusesRoutesScreen({super.key});

  final List<Map<String, String>> buses = [
    {
      'busId': 'BUS-01',
      'route': 'Chauthe - Bagar',
      'fare': 'Rs. 15/km',
    },
    {
      'busId': 'BUS-02',
      'route': 'Bagar - Chorapatan',
      'fare': 'Rs. 18/km',
    },
    {
      'busId': 'BUS-03',
      'route': 'Hamja - Buspark',
      'fare': 'Rs. 20/km',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title + Add button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Buses & Routes',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('Add Bus'),
                onPressed: () {
                  _showAddBusDialog(context);
                },
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Table
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Bus ID')),
                    DataColumn(label: Text('Route')),
                    DataColumn(label: Text('Fare / km')),
                    DataColumn(label: Text('Actions')),
                  ],
                  rows: buses.map((bus) {
                    return DataRow(
                      cells: [
                        DataCell(Text(bus['busId']!)),
                        DataCell(Text(bus['route']!)),
                        DataCell(Text(bus['fare']!)),
                        DataCell(
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit, color: Colors.blue),
                                onPressed: () {
                                  _showEditBusDialog(context, bus);
                                },
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  _showDeleteDialog(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ───────────────── Dialogs ─────────────────

  void _showAddBusDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const _BusDialog(title: 'Add Bus'),
    );
  }

  void _showEditBusDialog(
      BuildContext context, Map<String, String> bus) {
    showDialog(
      context: context,
      builder: (_) => _BusDialog(
        title: 'Edit Bus',
        bus: bus,
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Delete Bus'),
        content: const Text('Are you sure you want to delete this bus?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style:
                ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
class _BusDialog extends StatelessWidget {
  final String title;
  final Map<String, String>? bus;

  const _BusDialog({required this.title, this.bus});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Bus ID'),
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Route'),
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Fare per km'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
