import 'package:flutter/material.dart';
import 'package:life_travel/common/utils/routes.dart';
import 'package:life_travel/common/utils/user_type.dart';
import 'package:life_travel/common/widgets/bottom_nav.dart';
import 'package:life_travel/iot_asset_management/presentation/animated_marker_map.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: BottomNav(
            initialIndex: 0,
            onTabTapped: (int i) {},
            role: UserType.guide.toString(),
          ),
        ),
      ),
    );
  }
}
