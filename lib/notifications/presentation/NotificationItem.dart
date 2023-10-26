import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Título de la notificación'),
              Text('Descripción de la notificación'),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('08:30 AM'),
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