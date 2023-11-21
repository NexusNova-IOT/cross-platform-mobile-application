import 'package:flutter/material.dart';
import 'package:life_travel/common/widgets/life_travel_app_bar.dart';
import 'package:life_travel/iot_asset_management/presentation/tour_package_item/tour_item.dart';

import '../infraestructure/repositories/widgets/recomendation_section.dart';
import 'weather_iot_detail/weather_information.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LifeTravelAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15.0),
          Container(
            padding: const EdgeInsets.only(left: 16.0),
            child: const Text(
              'Weather',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          WeatherWidget(),
          Container(
            padding: const EdgeInsets.only(left: 16.0),
            child: const Text(
              'Tour Information',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TourItem(),
          Container(
            padding: const EdgeInsets.only(left: 16.0),
            child: const Text(
              'Recommendation',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          RecommendationSection(),
        ],
      ),
    );
  }
}
