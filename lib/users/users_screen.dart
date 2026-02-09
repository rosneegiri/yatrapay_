import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  final List<Map<String, String>> users = const [
    {
      'name': 'John Doe',
      'email': 'john@email.com',
      'role': 'User',
    },
    {
      'name': 'Admin One',
      'email': 'admin@yatrapa.com',
      'role': 'Admin',
    },
    {
      'name': 'Sarah Smith',
      'email': 'sarah@email.com',
      'role': 'User',
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
                'Users Management',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('Add User'),
                onPressed: () {
                  _showUserDialog(context, title: 'Add User');
                },
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Search
          TextField(
            decoration: InputDecoration(
              hintText: 'Search user...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
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
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Email')),
                    DataColumn(label: Text('Role')),
                    DataColumn(label: Text('Actions')),
                  ],
                  rows: users.map((user) {
                    return DataRow(
                      cells: [
                        DataCell(Text(user['name']!)),
                        DataCell(Text(user['email']!)),
                        DataCell(Text(user['role']!)),
                        DataCell(
                          Row(
                            children: [
                              IconButton(
                                tooltip: 'Edit',
                                icon: const Icon(Icons.edit, color: Colors.blue),
                                onPressed: () {
                                  _showUserDialog(
                                    context,
                                    title: 'Edit User',
                                    user: user,
                                  );
                                },
                              ),
                              IconButton(
                                tooltip: 'Delete',
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

  // ───────────── Dialogs ─────────────

  void _showUserDialog(
    BuildContext context, {
    required String title,
    Map<String, String>? user,
  }) {
    showDialog(
      context: context,
      builder: (_) => _UserDialog(title: title, user: user),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Delete User'),
        content: const Text('Are you sure you want to delete this user?'),
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
class _UserDialog extends StatefulWidget {
  final String title;
  final Map<String, String>? user;

  const _UserDialog({required this.title, this.user});

  @override
  State<_UserDialog> createState() => _UserDialogState();
}

class _UserDialogState extends State<_UserDialog> {
  late String selectedRole;

  @override
  void initState() {
    super.initState();
    selectedRole = widget.user?['role'] ?? 'User';
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Full Name'),
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: selectedRole,
            decoration: const InputDecoration(labelText: 'Role'),
            items: const [
              DropdownMenuItem(value: 'User', child: Text('User')),
              DropdownMenuItem(value: 'Admin', child: Text('Admin')),
            ],
            onChanged: (value) {
              setState(() => selectedRole = value!);
            },
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
