import 'package:flutter/material.dart';
import 'package:life_travel/identity_access_management/presentation/identity_access.dart';
import 'package:life_travel/tour_packages/presentation/tour_packages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'injections.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  // Guardar el token en SharedPreferences
  await saveTokenToSharedPreferences('eyJhbGciOiJSUzI1NiIsImtpZCI6ImQ0OWU0N2ZiZGQ0ZWUyNDE0Nzk2ZDhlMDhjZWY2YjU1ZDA3MDRlNGQiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vbGlmZXRyYXZlbC1hcHAiLCJhdWQiOiJsaWZldHJhdmVsLWFwcCIsImF1dGhfdGltZSI6MTY5OTg5NjgwNywidXNlcl9pZCI6IjZXS2pqNm95enJNVFVmdXc4ajd2RWtzM1l1dTEiLCJzdWIiOiI2V0tqajZveXpyTVRVZnV3OGo3dkVrczNZdXUxIiwiaWF0IjoxNjk5ODk2ODA3LCJleHAiOjE2OTk5MDA0MDcsImVtYWlsIjoidG91cmlzdDFAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7ImVtYWlsIjpbInRvdXJpc3QxQGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6InBhc3N3b3JkIn19.VwZbFkEfjTq-DVfz5WM67XLgPK2P3l5VosYB_4p9wy2fKOaCi6evawpNoZafDNkeixQbtEW2hSVDYUgKK7Pb2kAg3QJLXd1_Ex9-gLQejskvnBR1CDrMLMxVpIsg6bXEZGxJjlCTWH2pO4SvMEL7ZvPYA3CPBH7fWl-ymGv31y1sU8JAkIFRHgTZbLOcWkRqM62YubGZGpSX4OmBM8ozu2dfNnVUZCca6ay1gSbEzdbQGUS3s4K66O8ZnGLPcUbDQOsoZLB65EzHNlOTc5AniGFo1waON3bfCIp30TvcdQMv1BSzVdeKXY0ZdZ5AjtQfyVIcJbxZ1OUCpcON05k_Ng');

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