import 'package:life_travel/profile_management/domain/entities/agency_profile.dart';
import 'package:life_travel/profile_management/domain/entities/tourist_profile.dart';
import 'package:life_travel/profile_management/domain/interfaces/profile_management_repository.dart';
import 'package:life_travel/profile_management/infraestructure/data_sources/profile_management.dart';

class ProfileManagementRepositoryImpl implements ProfileManagementRepository {
  final ProfileManagementDataProvider profileManagementDataProvider;

  ProfileManagementRepositoryImpl(
      {required this.profileManagementDataProvider});

  @override
  Future<AgencyProfile> getAgencyProfile(String id) async {
    final agencyProfile =
        await profileManagementDataProvider.getAgencyProfileById(id);
    return agencyProfile;
  }

  @override
  Future<TouristProfile> getTouristProfile(String id) {
    final touristProfile =
        profileManagementDataProvider.getTouristProfileById(id);
    return touristProfile;
  }
}
