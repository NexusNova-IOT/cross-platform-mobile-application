import 'package:flutter/material.dart';
import 'package:life_travel/iot_asset_management/presentation/animated_marker_map.dart';
import 'package:life_travel/iot_asset_management/presentation/weather_iot.dart';
import 'package:life_travel/tour_experience/presentation/tour_packages.dart';

import '../../profile_management/presentation/profile_management.dart';

class Routes extends StatelessWidget {
  final int index;
  final String role;

  const Routes({Key? key, required this.index, required this.role})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> routes = [];

    if (role == 'ROLE_AGENCY') {
      routes = [
        const TourPackages(),
        const AnimatedMarkerMap(),
        const UserProfile(),
      ];
    } else if (role == 'ROLE_TOURIST') {
      routes = [
        const Weather(),
        const TourPackages(),
        const UserProfile(),
      ];
    }

    if (index < routes.length) {
      return routes[index];
    } else {
      return Container();
    }
  }
}
