import 'package:flutter/material.dart';
import 'package:life_travel/identity_access_management/presentation/identity_access.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: SignInScreen(),
        ),
      ),
    );
  }
}
