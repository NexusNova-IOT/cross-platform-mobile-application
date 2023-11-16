import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injections.dart';
import '../../../domain/entities/iot_weather.dart';
import '../../../presentation/weather_iot_detail/bloc/bloc.dart';


class RecommendationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<IotWeatherDetailBloc>(
      create: (BuildContext context) =>
      serviceLocator<IotWeatherDetailBloc>()..add(FetchIotWeatherDetailEvent()),
      child: BlocBuilder<IotWeatherDetailBloc, IotWeatherDetailState>(
        builder: (BuildContext context, IotWeatherDetailState state) {
          if (state is IotWeatherDetailLoadedState) {
            final IotWeather iotWeather = state.iotWeather;

            return Column(
              children: [
                buildRecommendationRow(
                  iconColor: Color(0xFFF25858),
                  icon: Icons.local_mall,
                  title: 'Clothes',
                  recommendations: iotWeather.clothes,
                ),
                SizedBox(height: 16),
                buildRecommendationRow(
                  iconColor: Color(0xFF54A9E7),
                  icon: Icons.beach_access,
                  title: 'Trip Objects',
                  recommendations: iotWeather.objects,
                ),
              ],
            );
          } else if (state is IotWeatherDetailErrorState) {
            // Maneja el caso de error
            return Text('Error: ${state.error}');
          } else {
            return CircularProgressIndicator();
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
        // Sección de Icono
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
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // Mostrar las recomendaciones dinámicamente
            for (String recommendation in recommendations)
              Text('• $recommendation'),
          ],
        ),
      ],
    );
  }
}