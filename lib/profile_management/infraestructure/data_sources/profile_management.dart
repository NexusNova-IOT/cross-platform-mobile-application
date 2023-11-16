import 'dart:convert';

import 'package:life_travel/common/config/local_storage.dart';
import 'package:life_travel/profile_management/api/profile_management.dart';
import 'package:life_travel/profile_management/domain/entities/agency_profile.dart';
import 'package:life_travel/profile_management/domain/entities/tourist_profile.dart';
import 'package:http/http.dart' as http;

class ProfileManagementDataProvider {
  Future<String?> getBearerToken() async {
    final Object? token =
        LocalStorage.sharedPreferences.get('token') as String?;

    if (token == null) {
      throw Exception('No token found');
    }

    return token as String;
  }

  Future<TouristProfile> getTouristProfileById(String id) async {
    try {
      final String? token =
          await LocalStorage.sharedPreferences.get('token') as String?;
      if (token == null) {
        throw Exception('No se pudo obtener el token');
      }

      final String url = ProfileManagementApi.baseUrl +
          ProfileManagementApi.touristProfileUrl +
          id;
      final response = await http.get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        return TouristProfile.fromJson(data);
      } else {
        throw Exception(
            'Error en la llamada a la API: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to get tourist profile with ID $id: $e');
    }
  }

  Future<AgencyProfile> getAgencyProfileById(String id) async {
    try {
      final String? token = await getBearerToken();
      if (token == null) {
        throw Exception('No se pudo obtener el token');
      }

      final String url = ProfileManagementApi.baseUrl +
          ProfileManagementApi.agencyProfileUrl +
          id;
      final response = await http.get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return AgencyProfile.fromJson(data);
      } else {
        throw Exception(
            'Error en la llamada a la API: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to get agency profile with ID $id: $e');
    }
  }
}
