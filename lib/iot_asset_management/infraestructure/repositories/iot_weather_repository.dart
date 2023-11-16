import 'package:life_travel/iot_asset_management/domain/entities/iot_weather.dart';

import '../../domain/interfaces/iot_weather_interface.dart';
import '../data_sources/iot_weather_data_provider.dart';

class IotWeatherRepositoryImpl implements IotWeatherRepository {
  final IotWeatherDataProvider dataProvider;

  IotWeatherRepositoryImpl({required this.dataProvider});

  @override
  Future<IotWeather> getIotWeatherInfoByTouristId(String id) async {
    try {
      final IotWeather iotWeatherInfo = await dataProvider.getIotWeatherInfoByTouristId(id);
      return iotWeatherInfo;
    } catch (e) {
      throw Exception('Failed to get tour iot Weather Info with tourist ID $id: $e');
    }
  }
}