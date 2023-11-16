import 'package:life_travel/iot_asset_management/domain/entities/iot_weather.dart';

import '../domain/interfaces/iot_weather_interface.dart';

class IotWeatherFacadeService {
  final IotWeatherRepository iotWeatherRepository;

  IotWeatherFacadeService({required this.iotWeatherRepository});

    Future<IotWeather> getIotWeatherInfoByTouristId(String id) {
    return iotWeatherRepository.getIotWeatherInfoByTouristId(id);
  }
}