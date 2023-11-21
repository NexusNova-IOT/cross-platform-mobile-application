import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injections.dart';
import '../../../domain/entities/iot_weather.dart';
import '../../../presentation/weather_iot_detail/bloc/bloc.dart';

class RecommendationSection extends StatefulWidget {
  const RecommendationSection({Key? key}) : super(key: key);

  @override
  _RecommendationSectionState createState() => _RecommendationSectionState();
}

class _RecommendationSectionState extends State<RecommendationSection> {
  late IotWeatherDetailBloc _iotWeatherDetailBloc;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _iotWeatherDetailBloc = serviceLocator<IotWeatherDetailBloc>();

    _timer = Timer.periodic(const Duration(seconds: 20), (timer) {
      _iotWeatherDetailBloc.add(FetchIotWeatherDetailEvent());
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<IotWeatherDetailBloc>(
      create: (BuildContext context) =>
          _iotWeatherDetailBloc..add(FetchIotWeatherDetailEvent()),
      child: BlocBuilder<IotWeatherDetailBloc, IotWeatherDetailState>(
        builder: (BuildContext context, IotWeatherDetailState state) {
          if (state is IotWeatherDetailLoadedState) {
            final IotWeather iotWeather = state.iotWeather;

            return Column(
              children: [
                buildRecommendationRow(
                  iconColor: const Color(0xFFF25858),
                  icon: Icons.local_mall,
                  title: 'Clothes',
                  recommendations: iotWeather.clothes,
                ),
                const SizedBox(height: 16),
                buildRecommendationRow(
                  iconColor: const Color(0xFF54A9E7),
                  icon: Icons.beach_access,
                  title: 'Trip Objects',
                  recommendations: iotWeather.objects,
                ),
              ],
            );
          } else if (state is IotWeatherDetailErrorState) {
            return Card(
              color: const Color(0xFF161D2F),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    "You don't have any recommendations yet.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget buildRecommendationRow({
    required Color iconColor,
    required IconData icon,
    required String title,
    required List<String> recommendations,
  }) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: iconColor,
              border: Border.all(color: Colors.black),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            for (String recommendation in recommendations)
              Text('• $recommendation'),
          ],
        ),
      ],
    );
  }
}
