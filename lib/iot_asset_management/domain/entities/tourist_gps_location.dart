import 'package:equatable/equatable.dart';

class TouristGpsLocation extends Equatable {
  final int id;
  final double latitude;
  final double longitude;
  final String nombre;
  final String imgUrl;

  const TouristGpsLocation({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.nombre,
    required this.imgUrl,
  });

  @override
  List<Object?> get props => [
        id,
        latitude,
        longitude,
        nombre,
        imgUrl,
      ];

  static Future<TouristGpsLocation> fromJson(Map<String, dynamic> data) {
    return Future.value(TouristGpsLocation(
      id: data['id'],
      latitude: data['latitude'],
      longitude: data['longitude'],
      nombre: data['nombre'],
      imgUrl: data['imgUrl'],
    ));
  }
}
