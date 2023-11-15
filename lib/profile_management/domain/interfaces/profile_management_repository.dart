import 'package:life_travel/profile_management/domain/entities/agency_profile.dart';
import 'package:life_travel/profile_management/domain/entities/tourist_profile.dart';

abstract class ProfileManagementRepository {
  Future<AgencyProfile> getAgencyProfile(String id);
  Future<TouristProfile> getTouristProfile(String id);
}
