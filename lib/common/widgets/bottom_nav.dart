import 'package:flutter/material.dart';


class BottomNav extends StatefulWidget {
  final Function currentIndex;
  const BottomNav({super.key, required this.currentIndex});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(

        currentIndex: index,
        onTap: (int i) {
          setState(() {
            index = i;
            widget.currentIndex(i);
          });
        },
        backgroundColor: Colors.lightBlue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        iconSize: 30,

        type : BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month_outlined), label: 'Calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),

        ]);
  }
}