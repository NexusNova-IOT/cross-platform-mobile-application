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
    final Distance distance = const Distance();
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

final sampleLocations = [
  const LatLng(-12.115052, -76.871530),
  const LatLng(-12.115081, -76.871200),
  const LatLng(-12.115561, -76.871645),
  const LatLng(-12.115031, -76.871500),
  const LatLng(-12.115031, -76.871500),
  const LatLng(-12.115021, -76.871200),
  const LatLng(-12.112091, -76.871700),
  const LatLng(-12.111231, -76.871902),
  const LatLng(-12.117031, -76.871100),
  const LatLng(-12.115631, -76.871600),
];

final touristSample = [
  MapMarker(
    image: 'assets/images/marker.png',
    name: 'Marta Diaz',
    location: sampleLocations[0],
  ),
  MapMarker(
    image: 'assets/images/marker.png',
    name: 'Juan Pérez',
    location: sampleLocations[1],
  ),
  MapMarker(
    image: 'assets/images/marker.png',
    name: 'Ana García',
    location: sampleLocations[2],
  ),
  MapMarker(
    image: 'assets/images/marker.png',
    name: 'Carlos Rodríguez',
    location: sampleLocations[3],
  ),
  MapMarker(
    image: 'assets/images/marker.png',
    name: 'Luisa Martinez',
    location: sampleLocations[4],
  ),
  MapMarker(
    image: 'assets/images/marker.png',
    name: 'Diego López',
    location: sampleLocations[5],
  ),
  MapMarker(
    image: 'assets/images/marker.png',
    name: 'Sofía Ramirez',
    location: sampleLocations[6],
  ),
  MapMarker(
    image: 'assets/images/marker.png',
    name: 'Manuel Torres',
    location: sampleLocations[7],
  ),
  MapMarker(
    image: 'assets/images/marker.png',
    name: 'Elena Fernández',
    location: sampleLocations[8],
  ),
  MapMarker(
    image: 'assets/images/marker.png',
    name: 'Pedro Sánchez',
    location: sampleLocations[9],
  ),
];
