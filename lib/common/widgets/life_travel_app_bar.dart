import 'package:flutter/material.dart';

class LifeTravelAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const LifeTravelAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Image.asset('images/life-travel-banner.png'),
          )
        ],
      ),
      backgroundColor: const Color(0xFF161D2F),
    );
  }
}
