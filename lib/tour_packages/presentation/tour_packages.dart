import 'package:flutter/material.dart';
import 'package:life_travel/common/utils/user_type.dart';
import 'package:life_travel/common/widgets/bottom_nav.dart';
import 'package:life_travel/common/widgets/life_travel_app_bar.dart';

class TourPackages extends StatefulWidget {
  const TourPackages({super.key});

  @override
  State<TourPackages> createState() => TourPackagesState();
}

class TourPackagesState extends State<TourPackages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LifeTravelAppBar(),
    );
  }
}
