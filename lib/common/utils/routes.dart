import 'package:flutter/material.dart';
import 'package:life_travel/common/utils/user_type.dart';
import 'package:life_travel/iot_asset_management/presentation/animated_marker_map.dart';
import 'package:life_travel/iot_asset_management/presentation/weather_iot.dart';
import 'package:life_travel/tour_packages/presentation/tour_packages.dart';

import '../../notifications/presentation/notifications.dart';

import '../../profile_management/presentation/profile_management.dart';

class Routes extends StatelessWidget {
  final int index;
  final String role;

  const Routes({Key? key, required this.index, required this.role})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(role);
    List<Widget> routes = [];

    if (role == 'ROLE_AGENCY') {
      routes = [
        const TourPackages(),
        Notifications(),
        const AnimatedMarkerMap(),
        UserProfile(),
      ];
    } else if (role == 'ROLE_TOURIST') {
      routes = [
        Weather(),
        Notifications(),
        const TourPackages(),
        UserProfile(),
      ];
    }

    if (index < routes.length) {
      return routes[index];
    } else {
      return Container();
    }
  }
}

class CalendarRoute extends StatelessWidget {
  const CalendarRoute();

  @override
  Widget build(BuildContext context) {
    // Implement your Calendar route UI here.
    return Container(
      child: Text("Calendar Route"),
    );
  }
}
