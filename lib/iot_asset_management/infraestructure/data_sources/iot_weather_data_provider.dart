import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../api/iot._weather_api.dart';
import '../models/iot_weather_model.dart';

class IotWeatherDataProvider {
  Future<String> getBearerToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    if (token == null) {
      throw Exception('No se encontró el token en SharedPreferences.');
    }

    return token;
  }

  Future<IotWeatherModel> getIotWeatherInfoByTouristId(String id) async {
    try {
      final bearerToken = await getBearerToken();
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
