import 'package:flutter/material.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 16, bottom: 16),
      child: Row(
        children: [
          Image.asset(
            'images/weather.png',
            width: 80,
            height: 80,
          ),
          const SizedBox(width: 20),
          const Text(
            'temperature',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
