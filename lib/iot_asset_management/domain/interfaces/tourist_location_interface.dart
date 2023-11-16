import 'package:life_travel/iot_asset_management/infraestructure/models/tourist_location_model.dart';

abstract class TouristLocationInterface {
  Future<List<TouristLocationModel>> getTouristLocations();
}
