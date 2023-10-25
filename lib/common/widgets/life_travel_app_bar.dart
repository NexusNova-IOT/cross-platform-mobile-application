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
            width: 100, // Personaliza el ancho
            height: 100, // Personaliza la altura
            child: Image.asset('images/life-travel-banner.png'),
          )
        ],
      ),
      backgroundColor: const Color(0xFF161D2F),
    );
  }
}
