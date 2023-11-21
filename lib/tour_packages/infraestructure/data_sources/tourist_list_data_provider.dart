import 'package:http/http.dart' as http;
import 'package:life_travel/profile_management/domain/entities/tourist_profile.dart';
import 'package:life_travel/tour_packages/api/booking_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TourListDataProvider {
  Future<String> getBearerToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    if (token == null) {
      throw Exception('No se encontró el token en SharedPreferences.');
    }

    return token;
  }

  Future<List<TouristProfile>> getTourList(int packageId) async {
    try {
      final bearerToken = await getBearerToken();
      final DateTime now = DateTime.now();
      final String url =
          "https://lifetravel-iot-api.azurewebsites.net/api/v1/package/$packageId/date/$now";

      final response = await http.get(
        Uri(path: url),
        headers: {'Authorization': 'Bearer $bearerToken'},
      );
      print('getTourList');
      print(response.body);
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = response.body as List<dynamic>;
        final List<TouristProfile> tourList = jsonData
            .map((json) => TouristProfile.fromJson(json))
            .cast<TouristProfile>()
            .toList();
        return tourList;
      }
    } catch (e) {
      throw Exception('Failed to get tour list: $e');
    }
    throw Exception('Failed to get tour list');
  }
}
