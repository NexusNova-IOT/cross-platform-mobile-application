import 'package:equatable/equatable.dart';

import '../../../domain/entities/iot_weather.dart';

abstract class IotWeatherDetailState extends Equatable {
  const IotWeatherDetailState();
}

class InitialIotWeatherDetailState extends IotWeatherDetailState {
  @override
  List<Object> get props => [];
}

class IotWeatherDetailLoadedState extends IotWeatherDetailState {
  IotWeatherDetailLoadedState(this.iotWeather);
  final IotWeather iotWeather;

  @override
  List<Object> get props => [iotWeather];

  @override
  String toString() {
    return 'IotWeatherDetailLoadedState: $iotWeather';
  }
}

class IotWeatherDetailErrorState extends IotWeatherDetailState {
  final String error;

  IotWeatherDetailErrorState(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() {
    return 'IotWeatherDetailErrorState: $error';
  }
}