import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injections.dart';
import '../../domain/entities/iot_weather.dart';
import 'bloc/bloc.dart';

class WeatherWidget extends StatefulWidget {
  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  late Timer _timer;
  final _refreshController = StreamController<void>();

  @override
  void initState() {
    super.initState();
    // Inicia el timer y actualiza cada 10 segundos
    _timer = Timer.periodic(Duration(seconds: 10), (_) {
      _refreshController.add(null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<IotWeatherDetailBloc>(
      create: (BuildContext context) => serviceLocator<IotWeatherDetailBloc>()
        ..add(FetchIotWeatherDetailEvent()),
      child: BlocBuilder<IotWeatherDetailBloc, IotWeatherDetailState>(
        builder: (BuildContext context, IotWeatherDetailState state) {
          if (state is IotWeatherDetailLoadedState) {
            final IotWeather iotWeather = state.iotWeather;

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
                  Text(
                    '${iotWeather.temperature} °C',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    '${iotWeather.humidity} %',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          } else if (state is IotWeatherDetailErrorState) {
            return Card(
              color: const Color(0xFF161D2F),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: const Text(
                    "You don't have any recommendations yet.",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          } else {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
              ],
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _refreshController.close();
    super.dispose();
  }
}
