import 'package:flutter/material.dart';
import '../infraestructure/repositories/widgets/ItineraryItem.dart';
import 'package:life_travel/common/widgets/life_travel_app_bar.dart';

import 'booking_list/booking_list_screen.dart';

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
      body: Column(
        children: [
          const SizedBox(height: 15.0),
          const Text(
            'My Itinerary',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: BookingListScreen(),
          ),
        ],
      ),
    );
  }
}
