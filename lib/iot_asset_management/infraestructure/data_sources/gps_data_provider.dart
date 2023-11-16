import 'dart:convert';

import 'package:life_travel/iot_asset_management/api/gps_api.dart';
import 'package:life_travel/iot_asset_management/infraestructure/models/tourist_location_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class GpsDataProvider {
  Future<String> getBearerToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    if (token == null) {
      throw Exception('No se encontró el token en SharedPreferences.');
    }

    return token;
  }

  Future<List<TouristLocationModel>> getTouristLocationByTouristId(
      String agencyUserId) async {
    try {
      final bearerToken = await getBearerToken();
      final String url = GpsApi.baseUrl + GpsApi.gps + agencyUserId;

      final response = await http.get(Uri.parse(url),
          headers: {'Authorization': 'Bearer $bearerToken'});

      print("response body " + response.body);
      print(url);
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);

        print("json data " + jsonData.toString());
        final List<TouristLocationModel> touristLocations = jsonData
            .map((json) => TouristLocationModel.fromJson(json))
            .toList();

        print("tourist locations " + touristLocations.toString());

        return touristLocations;
      } else {
        throw Exception(
            'Failed to get tourist locations. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to get tourist locations: 2 $e');
    }
  }
}
