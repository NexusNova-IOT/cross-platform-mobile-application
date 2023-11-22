import '../../domain/entities/iot_weather.dart';

class IotWeatherModel extends IotWeather {
  IotWeatherModel({
    required double temperature,
    required double humidity,
    required List<String> clothes,
    required List<String> objects,
  }) : super(
    temperature: temperature,
    humidity: humidity,
    clothes: clothes,
    objects: objects,
  );

  factory IotWeatherModel.fromJson(Map<String, dynamic> json) {
    return IotWeatherModel(
      temperature: json['temperature'] ?? 0,
      humidity: json['humidity'] ?? 0,
      clothes: List<String>.from(json['clothes'] ?? []),
      objects: List<String>.from(json['objects'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'temperature': temperature,
      'humidity': humidity,
      'clothes': clothes,
      'objects': objects,
    };
  }
}