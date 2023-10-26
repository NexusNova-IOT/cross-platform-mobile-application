import 'package:latlong2/latlong.dart';
import 'package:life_travel/iot_asset_management/infraestructure/models/map_marker.dart';

final sampleLocations = [
  const LatLng(-12.104049, -76.9612091),
  const LatLng(-12.103044, -76.9622091),
  const LatLng(-12.104042, -76.9632091),
  const LatLng(-12.104043, -76.9652091),
  const LatLng(-12.102046, -76.9662091),
  const LatLng(-12.104547, -76.9672091),
  const LatLng(-12.104048, -76.9682091),
  const LatLng(-12.104711, -76.9692091),
  const LatLng(-12.104029, -76.9618091),
  const LatLng(-12.101539, -76.9659091),
];

final touristSample = [
  MapMarker(
    image: 'assets/images/marker.png',
    name: 'Nicole Price',
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
