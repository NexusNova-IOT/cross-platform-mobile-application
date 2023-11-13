import 'package:life_travel/tour_packages/infraestructure/models/tour_package_model.dart';
import 'package:life_travel/tour_packages/api/tour_package_api.dart';
import 'package:http/http.dart' as http;

class TourPackageDataProvider {
  final String bearerToken; // Agrega esta variable para almacenar el token de portador.

  TourPackageDataProvider({required this.bearerToken});

  Future<List<TourPackageModel>> fetchTourPackages() async {
    try {
      final response = await http.get(
        Uri.parse('${TourPackageApi.baseUrl}${TourPackageApi.tourPackages}'),
        headers: {'Authorization': 'Bearer $bearerToken'}, // Agrega el encabezado con el token de portador.
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
      final response = await http.get(
        Uri.parse('${TourPackageApi.baseUrl}${TourPackageApi.tourPackages}/$id'),
        headers: {'Authorization': 'Bearer $bearerToken'}, // Agrega el encabezado con el token de portador.
      );

      if (response.statusCode == 200) {
        final dynamic jsonData = response.body;
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