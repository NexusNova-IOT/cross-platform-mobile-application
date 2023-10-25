import 'package:latlong2/latlong.dart';
import 'package:life_travel/iot_asset_management/infraestructure/models/map_marker.dart';

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
