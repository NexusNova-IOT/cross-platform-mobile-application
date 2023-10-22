import 'package:flutter/material.dart';
import 'package:life_travel/profile_management/presentation/profile_management.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: UserProfile(), // Usa el widget MyContainer aquí
        ),

      ),
    );
  }
}
