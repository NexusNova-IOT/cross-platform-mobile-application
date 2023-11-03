import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:life_travel/common/config/local_storage.dart';

class ApiService {
  final String baseUrl =
      'https://lifetravel-iot-backend.azurewebsites.net/api/v1';
  final Object? token = LocalStorage.sharedPreferences.get('token') as String?;

  Future<Map<String, dynamic>> login(String userId) async {
    final String apiUrl = '$baseUrl/users/login/$userId';

    print('API URL: $apiUrl');
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Error en la llamada a la API: ${response.reasonPhrase}');
    }
  }
}
