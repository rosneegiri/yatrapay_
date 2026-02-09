import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xFFF5F7FB),
      fontFamily: 'Inter',
      primaryColor: Colors.blue,

      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),

      dataTableTheme: const DataTableThemeData(
        headingTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
