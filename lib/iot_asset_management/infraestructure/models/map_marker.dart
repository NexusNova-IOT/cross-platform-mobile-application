import 'dart:math';

import 'package:latlong2/latlong.dart';

class MapMarker {
  const MapMarker({
    required this.image,
    required this.name,
    required this.location,
  });
  final String image;
  final String name;
  final LatLng location;

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
