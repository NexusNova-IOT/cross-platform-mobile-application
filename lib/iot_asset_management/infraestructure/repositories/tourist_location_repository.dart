import 'package:life_travel/common/config/local_storage.dart';
import 'package:life_travel/iot_asset_management/domain/interfaces/tourist_location_interface.dart';
import 'package:life_travel/iot_asset_management/infraestructure/data_sources/gps_data_provider.dart';
import 'package:life_travel/iot_asset_management/infraestructure/model/tourist_location_model.dart';

class TouristLocationRepositoryImpl implements TouristLocationRepository {
  GpsDataProvider gpsDataProvider;

  TouristLocationRepositoryImpl({required this.gpsDataProvider});

  @override
  Future<List<TouristLocationModel>> getTouristLocations() async {
    try {
      final Object? userId = LocalStorage.sharedPreferences.get('userId');

      if (userId == null) throw Exception('No token found');

      final List<TouristLocationModel> touristLocations = await gpsDataProvider
          .getTouristLocationByTouristId(userId.toString());


      return touristLocations;
    } catch (e) {
      throw Exception('Failed to get tourist locations 1: $e');
    }
  }
}
