import 'dart:convert';

import 'package:life_travel/common/config/local_storage.dart';
import 'package:life_travel/iot_asset_management/api/gps_api.dart';
import 'package:life_travel/iot_asset_management/infraestructure/model/tourist_location_model.dart';
import 'package:http/http.dart' as http;

class GpsDataProvider {
  LocalStorage localStorage = LocalStorage();

  Future<List<TouristLocationModel>> getTouristLocationByTouristId(
      String agencyUserId) async {
    try {
      final bearerToken = await localStorage.getBearerToken();
      final String url = GpsApi.baseUrl + GpsApi.gps + agencyUserId;

      final response = await http.get(Uri.parse(url),
          headers: {'Authorization': 'Bearer $bearerToken'});

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);

        final List<TouristLocationModel> touristLocations = jsonData
            .map((json) => TouristLocationModel.fromJson(json))
            .toList();

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
