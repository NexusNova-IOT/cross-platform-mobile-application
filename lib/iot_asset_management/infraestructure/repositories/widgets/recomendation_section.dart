/*import 'package:flutter/material.dart';

class RecomendationSection extends StatelessWidget {
  final int index;

  RecomendationSection({required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: const Icon(
              Icons.,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Notification Title $index',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Notification Description $index',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          const Column(
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
}*/
