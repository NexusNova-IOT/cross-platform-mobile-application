import 'package:flutter/material.dart';

import '../../common/widgets/life_travel_app_bar.dart';
import 'NotificationItem.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LifeTravelAppBar(),
      body: Column(
        children: [
          const SizedBox(height: 15.0),
          const Text(
            'My Itinerary',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return NotificationItem(index: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
