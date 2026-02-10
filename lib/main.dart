import 'package:flutter/material.dart';
import 'layout/app_layout.dart';
import 'thems.dart';

void main() {
  runApp(const YatrapaAdminApp());
}

class YatrapaAdminApp extends StatelessWidget {
  const YatrapaAdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yatrapa Admin',
      theme: AppTheme.lightTheme,
      // home: const AppLayout(isAdmin: true), 
      home: const AppLayout(isAdmin: false),

    );
  }
}
