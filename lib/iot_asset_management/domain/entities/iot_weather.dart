import 'package:equatable/equatable.dart';

class IotWeather extends Equatable {
  IotWeather({
    required this.temperature,
    required this.humidity,
    required this.clothes,
    required this.objects,
  });

  final double temperature;
  final double humidity;
  final List<String> clothes;
  final List<String> objects;

  @override
  List<Object> get props => <Object>[temperature, humidity, clothes, objects];
}