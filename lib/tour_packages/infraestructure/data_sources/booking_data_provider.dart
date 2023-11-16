import 'dart:convert';

import 'package:life_travel/tour_packages/api/booking_api.dart';
import 'package:life_travel/tour_packages/infraestructure/models/booking_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BookingDataProvider {
  Future<String> getBearerToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    if (token == null) {
      throw Exception('No se encontró el token en SharedPreferences.');
    }

    return token;
  }

  Future<List<BookingModel>> getBookingsByTouristId(String id) async {
    try {
      final bearerToken = await getBearerToken();
      final response = await http.get(
        Uri.parse('${BookingApi.baseUrl}${BookingApi.bookings}/tourist/$id'),
        headers: {'Authorization': 'Bearer $bearerToken'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);

        final List<BookingModel> bookings =
            jsonData.map((json) => BookingModel.fromJson(json)).toList();

        return bookings;
      } else {
        throw Exception(
            'Failed to get bookings. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to get bookings: $e');
    }
  }

  Future<List<BookingModel>> getBookingsByAgencyId(String id) async {
    try {
      final bearerToken = await getBearerToken();
      final response = await http.get(
        Uri.parse('${BookingApi.baseUrl}${BookingApi.bookings}/agency/$id'),
        headers: {'Authorization': 'Bearer $bearerToken'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);

        final List<BookingModel> bookings =
            jsonData.map((json) => BookingModel.fromJson(json)).toList();

        return bookings;
      } else {
        throw Exception(
            'Failed to get bookings. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to get bookings: $e');
    }
  }
}
