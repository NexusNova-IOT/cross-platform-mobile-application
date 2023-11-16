import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:life_travel/common/config/local_storage.dart';
import 'package:life_travel/common/utils/routes.dart';
import 'package:life_travel/common/utils/user_type.dart';
import 'package:life_travel/identity_access_management/api/identity_access.dart';

import 'bottom_nav.dart';

class Base extends StatefulWidget {
  const Base({Key? key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int currentIndex = 0;
  BottomNav? bottomNav;
  late Future<String?> role;
  ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    role = getUserRole();
  }

  Future<String?> getUserRole() async {
    try {
      final Object? token = LocalStorage.sharedPreferences.get('userId');
      if (token != null) {
        final String userId = token as String;
        final userRole = await apiService.login(userId).then((value) {
          return value['role'];
        });

        if (userRole != null) {
          LocalStorage.sharedPreferences.setString('userRole', userRole!);
          return userRole;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return UserType.ROLE_TOURIST.toString();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: role,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 50, height: 50, child: CircularProgressIndicator()),
            ],
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          final roleValue = snapshot.data ?? UserType.ROLE_TOURIST.toString();
          bottomNav = BottomNav(
            currentIndex: (i) {
              setState(() {
                currentIndex = i;
              });
            },
            role: roleValue,
          );

          return MaterialApp(
            home: Scaffold(
              body: Routes(
                index: currentIndex,
                role: roleValue,
              ),
              bottomNavigationBar: bottomNav,
            ),
          );
        }
      },
    );
  }
}
