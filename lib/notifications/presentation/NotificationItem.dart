import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  final int index;

  NotificationItem({required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Notification Title $index',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Notification Description $index',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '08:30 AM',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.brightness_1,
                color: Colors.red,
                size: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
