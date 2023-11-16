import 'dart:math';

import 'package:latlong2/latlong.dart';
import 'package:life_travel/iot_asset_management/domain/entities/tourist_gps_location.dart';

class TouristLocationModel extends TouristGpsLocation {
  const TouristLocationModel(
      {required super.id,
      required super.latitude,
      required super.longitude,
      required super.nombre,
      required super.imgUrl});

  factory TouristLocationModel.fromJson(Map<String, dynamic> json) {
    // ignore: avoid_print
    print("json factory" + json.toString());
    return TouristLocationModel(
      id: json['id'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      nombre: json['nombre'],
      imgUrl: json['imgUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': super.id,
      'latitude': super.latitude,
      'longitude': super.longitude,
      'nombre': super.nombre,
      'imgUrl': super.imgUrl,
    };
  }

  LatLng get location => LatLng(super.latitude, super.longitude.toDouble());

  getDistance(LatLng point) {
    const Distance distance = Distance();
    return distance.as(
      LengthUnit.Meter,
      location,
      point,
    );
  }

  double calculateBearing(LatLng referencePoint) {
    final double lat1 = location.latitude;
    final double lon1 = location.longitude;
    final double lat2 = referencePoint.latitude;
    final double lon2 = referencePoint.longitude;
    final double deltaLon = lon2 - lon1;
    final double y = sin(deltaLon) * cos(lat2);
    final double x =
        cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(deltaLon);
    final double initialBearing = atan2(y, x);
    final double degrees = initialBearing * (180.0 / pi);

    return (degrees + 360) % 360;
  }
}
