import 'dart:convert';

import 'package:life_travel/tour_experience/infraestructure/model/tour_package_model.dart';
import 'package:life_travel/tour_experience/api/tour_package_api.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/config/local_storage.dart';

class TourPackageDataProvider {
  LocalStorage localStorage = LocalStorage();

  Future<List<TourPackageModel>> fetchTourPackages() async {
    try {
      final bearerToken = await localStorage.getBearerToken();
      final response = await http.get(
        Uri.parse('${TourPackageApi.baseUrl}${TourPackageApi.tourPackages}'),
        headers: {'Authorization': 'Bearer $bearerToken'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = response.body as List<dynamic>;
        final List<TourPackageModel> tourPackages =
            jsonData.map((json) => TourPackageModel.fromJson(json)).toList();
        return tourPackages;
      } else {
        throw Exception(
            'Failed to fetch tour packages. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch tour packages: $e');
    }
  }

  Future<TourPackageModel> getTourPackage(int id) async {
    try {
      final bearerToken = await localStorage.getBearerToken();
      final response = await http.get(
        Uri.parse(
            '${TourPackageApi.baseUrl}${TourPackageApi.tourPackages}/$id'),
        headers: {'Authorization': 'Bearer $bearerToken'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        final TourPackageModel tourPackage =
            TourPackageModel.fromJson(jsonData);
        return tourPackage;
      } else {
        throw Exception(
            'Failed to get tour package. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to get tour package: $e');
    }
  }
}
