import 'package:flutter/material.dart';
import 'package:life_travel/identity_access_management/presentation/identity_access.dart';
import 'package:life_travel/tour_packages/presentation/tour_packages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'injections.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  // Guardar el token en SharedPreferences
  await saveTokenToSharedPreferences('eyJhbGciOiJSUzI1NiIsImtpZCI6IjQ0ZmJkZTdhZGY0ZTU3YWYxZWE4MzAzNmJmZjdkMzUxNTk3ZTMzNWEiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vbGlmZXRyYXZlbC1hcHAiLCJhdWQiOiJsaWZldHJhdmVsLWFwcCIsImF1dGhfdGltZSI6MTY5OTk3ODE1NCwidXNlcl9pZCI6IjZXS2pqNm95enJNVFVmdXc4ajd2RWtzM1l1dTEiLCJzdWIiOiI2V0tqajZveXpyTVRVZnV3OGo3dkVrczNZdXUxIiwiaWF0IjoxNjk5OTc4MTU0LCJleHAiOjE2OTk5ODE3NTQsImVtYWlsIjoidG91cmlzdDFAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7ImVtYWlsIjpbInRvdXJpc3QxQGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6InBhc3N3b3JkIn19.fYMaCk9e5kSTCIkkrKNb3xIKvn6HMB9cJHsAi3Zdpe4kk9X1awv-idtx51wtjVNHGesGcKYmZcqUPjp0kvbmWzz0otPYnPkxHs-3qRJtlOa8o9CRQoqZr6EaLj4NBkVMMpfkliEHPa_DAguXY0eJlflK10Cv3sC3sUpj6oFeVMI6JGv1QNFeyVKOXehzImrhKGMhOkyHi1_I3OvKxLvTVJ61qk8PmnzPTg5zGvOpw4O5moIe4MW2rIfm-Nkt0G-2gOIFThzTemrYgH_vlGgoyNV3-dAKz4vC1M5aFYg5r5r8fYZ7DkXmpmhSCHfgaKGDfe6vZdYyCeUUI1Ik_Ij7yA');

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          // Aquí puedes mostrar la pantalla que prefieras
          child: const TourPackages(),
        ),
      ),
    );
  }
}

Future<void> saveTokenToSharedPreferences(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
}