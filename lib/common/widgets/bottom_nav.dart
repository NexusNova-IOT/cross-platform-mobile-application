import 'package:flutter/material.dart';
import 'package:life_travel/common/utils/routes.dart';
import 'package:life_travel/common/utils/user_type.dart';

class BottomNav extends StatefulWidget {
  final Function(int) onTabTapped;
  final int initialIndex;
  final String role;

  const BottomNav(
      {Key? key,
      required this.onTabTapped,
      this.initialIndex = 0,
      required this.role})
      : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> bottomNavBarItems = [];

    if (widget.role == UserType.guide.toString()) {
      bottomNavBarItems = [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.notifications), label: 'Notifications'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.add_location), label: 'GPS'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.person), label: 'Profile'),
      ];
    } else if (widget.role == UserType.tourist.toString()) {
      bottomNavBarItems = [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.notifications), label: 'Notifications'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today), label: 'Calendar'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.person), label: 'Profile'),
      ];
    }

    return Scaffold(
      body: Routes(
        index: currentIndex,
        role: widget.role,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int i) {
          setState(() {
            currentIndex = i;
            widget.onTabTapped(i);
          });
        },
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        items: bottomNavBarItems,
      ),
    );
  }
}
