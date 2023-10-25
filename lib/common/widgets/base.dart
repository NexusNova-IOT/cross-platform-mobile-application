import 'package:flutter/material.dart';
import 'package:life_travel/common/utils/routes.dart';
import 'package:life_travel/common/utils/user_type.dart';

import 'bottom_nav.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int currentIndex = 0;
  BottomNav? bottomNav;

  @override
  void initState() {
    bottomNav = BottomNav(
      currentIndex: (i) {
        setState(() {
          currentIndex = i;
        });
      },
      role: UserType.guide.toString(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Routes(
          index: currentIndex,
          role: UserType.guide.toString(),
        ),
        bottomNavigationBar: bottomNav,
      ),
    );
  }
}
