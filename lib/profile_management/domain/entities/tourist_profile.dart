import 'package:equatable/equatable.dart';

class TouristProfile extends Equatable {
  final String id;
  final String name;
  final String birthDate;
  final String phoneNumber;
  final String touristPhotoUrl;
  final String email;
  final String emergencyPhoneNumber;

  const TouristProfile({
    required this.id,
    required this.name,
    required this.birthDate,
    required this.phoneNumber,
    required this.touristPhotoUrl,
    required this.email,
    required this.emergencyPhoneNumber,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        birthDate,
        phoneNumber,
        touristPhotoUrl,
        email,
        emergencyPhoneNumber,
      ];

  static Future<TouristProfile> fromJson(Map<String, dynamic> data) {
    return Future.value(TouristProfile(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      birthDate: data['birthDate'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      touristPhotoUrl: data['touristPhotoUrl'] ?? '',
      email: data['email'] ?? '',
      emergencyPhoneNumber: data['emergencyPhoneNumber'] ?? '',
    ));
  }
}
