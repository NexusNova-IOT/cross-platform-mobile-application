import 'package:life_travel/iot_asset_management/infraestructure/model/tourist_location_model.dart';

abstract class TouristLocationRepository {
  Future<List<TouristLocationModel>> getTouristLocations();
}
