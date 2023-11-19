import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injections.dart';
import '../../domain/entities/iot_weather.dart';
import 'bloc/bloc.dart';

class WeatherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<IotWeatherDetailBloc>(
      create: (BuildContext context) =>
      serviceLocator<IotWeatherDetailBloc>()..add(FetchIotWeatherDetailEvent()),
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
            // Maneja el caso de error
            return Text('Error: ${state.error}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}