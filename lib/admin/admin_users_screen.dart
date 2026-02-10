import 'package:flutter/material.dart';

class AdminUsersScreen extends StatelessWidget {
  const AdminUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Management')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text('User #$index'),
              subtitle: const Text('user@email.com'),
              trailing: PopupMenuButton<String>(
                onSelected: (value) {},
                itemBuilder: (_) => const [
                  PopupMenuItem(value: 'view', child: Text('View')),
                  PopupMenuItem(value: 'block', child: Text('Block')),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
