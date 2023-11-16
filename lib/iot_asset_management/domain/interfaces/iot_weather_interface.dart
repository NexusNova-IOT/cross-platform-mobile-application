import 'package:life_travel/iot_asset_management/domain/entities/iot_weather.dart';

abstract class IotWeatherRepository {
  Future<IotWeather> getIotWeatherInfoByTouristId(String id);
}