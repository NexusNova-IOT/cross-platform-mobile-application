import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:life_travel/common/config/local_storage.dart';
import 'package:life_travel/identity_access_management/presentation/identity_access.dart';
import 'injections.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  await LocalStorage.init();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: SignInScreen(),
        ),
      ),
    );
  }
}
