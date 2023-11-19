import 'package:flutter/material.dart';
import 'package:life_travel/common/utils/user_type.dart';

class BottomNav extends StatefulWidget {
  final Function currentIndex;
  final String role;

  const BottomNav({Key? key, required this.currentIndex, required this.role})
      : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> bottomNavBarItems = [];

    if (widget.role == 'ROLE_AGENCY') {
      bottomNavBarItems = [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.add_location), label: 'GPS'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.person), label: 'Profile'),
      ];
    } else if (widget.role == 'ROLE_TOURIST') {
      bottomNavBarItems = [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today), label: 'Calendar'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.person), label: 'Profile'),
      ];
    }

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (int i) {
        setState(() {
          currentIndex = i;
          widget.currentIndex(i);
        });
      },
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      iconSize: 30,
      type: BottomNavigationBarType.fixed,
      items: bottomNavBarItems,
    );
  }
}
