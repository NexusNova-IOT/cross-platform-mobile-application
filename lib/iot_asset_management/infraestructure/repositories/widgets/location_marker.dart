import 'package:flutter/material.dart';
import 'package:life_travel/common/utils/user_type.dart';

class MyLocationMarker extends StatelessWidget {
  const MyLocationMarker({Key? key, required this.role}) : super(key: key);

  final UserType role;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: role == UserType.ROLE_AGENCY
          ? Container(
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: const Icon(Icons.tour, size: 30, color: Colors.amber),
            )
          : role == UserType.ROLE_TOURIST
              ? Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                )
              : null,
    );
  }
}
