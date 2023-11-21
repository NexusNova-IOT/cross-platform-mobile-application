import 'package:equatable/equatable.dart';

class AgencyProfile extends Equatable {
  final String id;
  final String legalName;
  final String agencyPhotoUrl;
  final String phoneNumber;
  final String email;

  const AgencyProfile({
    required this.id,
    required this.legalName,
    required this.agencyPhotoUrl,
    required this.phoneNumber,
    required this.email,
  });

  @override
  List<Object?> get props => [
        id,
        legalName,
        agencyPhotoUrl,
        phoneNumber,
        email,
      ];

  static Future<AgencyProfile> fromJson(Map<String, dynamic> data) {
    return Future.value(AgencyProfile(
      id: data['id'] ?? '',
      legalName: data['legalName'] ?? '',
      agencyPhotoUrl: data['agencyPhotoUrl'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      email: data['email'] ?? '',
    ));
  }
}
