import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../common/config/local_storage.dart';
import '../../api/iot._weather_api.dart';
import '../model/iot_weather_model.dart';

class IotWeatherDataProvider {

  LocalStorage localStorage = LocalStorage();

  Future<IotWeatherModel> getIotWeatherInfoByTouristId(String id) async {
    try {
      final bearerToken = await localStorage.getBearerToken();
      final response = await http.get(
        Uri.parse('${IotWeatherApi.baseUrl}${IotWeatherApi.weatherSensor}/$id'),
        headers: {'Authorization': 'Bearer $bearerToken'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        final IotWeatherModel iotWeatherInfo =
            IotWeatherModel.fromJson(jsonData);
        return iotWeatherInfo;
      } else {
        throw Exception(
            'Failed to get iot Weather Info. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to get iot Weather Info: $e');
    }
  }
}
