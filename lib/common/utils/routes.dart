import 'package:flutter/material.dart';
import 'package:life_travel/common/utils/user_type.dart';
import 'package:life_travel/iot_asset_management/presentation/animated_marker_map.dart';

class Routes extends StatelessWidget {
  final int index;
  final String role;

  const Routes({Key? key, required this.index, required this.role})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> routes = [];

    if (role == UserType.guide.toString()) {
      routes = [
        const HomeRoute(),
        const NotificationRoute(),
        const AnimatedMarkerMap(),
        const ProfileRoute(),
      ];
    } else if (role == UserType.tourist.toString()) {
      routes = [
        const HomeRoute(),
        const NotificationRoute(),
        const CalendarRoute(),
        const ProfileRoute(),
      ];
    }

    if (index < routes.length) {
      return routes[index];
    } else {
      return Container();
    }
  }
}

class HomeRoute extends StatelessWidget {
  const HomeRoute();

  @override
  Widget build(BuildContext context) {
    // Implement your Home route UI here.
    return Container(
      child: Text("Home Route"),
    );
  }
}

class NotificationRoute extends StatelessWidget {
  const NotificationRoute();

  @override
  Widget build(BuildContext context) {
    // Implement your Notification route UI here.
    return Container(
      child: Text("Notification Route"),
    );
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

class ProfileRoute extends StatelessWidget {
  const ProfileRoute();

  @override
  Widget build(BuildContext context) {
    // Implement your Profile route UI here.
    return Container(
      child: Text("Profile Route"),
    );
  }
}
