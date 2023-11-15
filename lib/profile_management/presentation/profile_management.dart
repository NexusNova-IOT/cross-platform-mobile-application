import 'package:flutter/material.dart';
import 'package:life_travel/profile_management/infraestructure/repositories/widgets/profile_management.dart';
import 'package:life_travel/profile_management/presentation/widgets/agency_profile_widget.dart';
import 'package:life_travel/profile_management/presentation/widgets/tourist_profile_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:life_travel/profile_management/domain/entities/agency_profile.dart';
import 'package:life_travel/profile_management/domain/entities/tourist_profile.dart';
import 'package:life_travel/profile_management/domain/interfaces/profile_management_repository.dart';
import 'package:life_travel/profile_management/infraestructure/data_sources/profile_management.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  late Future<String?> _userRole;
  late Future<dynamic> _userProfile;

  final ProfileManagementRepository profileManagementRepository =
      ProfileManagementRepositoryImpl(
    profileManagementDataProvider: ProfileManagementDataProvider(),
  );

  @override
  void initState() {
    super.initState();
    _userRole = _getUserRole();
    _userProfile = _getUserProfile();
  }

  Future<String?> _getUserRole() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userRole');
  }

  Future<dynamic> _getUserProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');

    final userRole = await _userRole;

    if (userRole == 'ROLE_AGENCY') {
      return profileManagementRepository.getAgencyProfile(userId!);
    } else if (userRole == 'ROLE_TOURIST') {
      return profileManagementRepository.getTouristProfile(userId!);
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<dynamic>(
        future: _userProfile,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final userProfile = snapshot.data;

            return userProfile is AgencyProfile
                ? AgencyProfileWidget(userProfile: userProfile)
                : userProfile is TouristProfile
                    ? TouristProfileWidget(userProfile: userProfile)
                    : Container();
          }
        },
      ),
    );
  }
}
