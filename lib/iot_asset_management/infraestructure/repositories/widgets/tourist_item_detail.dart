import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:life_travel/iot_asset_management/infraestructure/models/map_marker.dart';

const _sampleLocation = LatLng(-12.115396, -76.871283);

class TouristItemDetail extends StatelessWidget {
  const TouristItemDetail({super.key, required this.touristItem});

  final MapMarker touristItem;

  @override
  Widget build(BuildContext context) {
    final double bearing = touristItem.calculateBearing(_sampleLocation);

    Icon arrowIcon;
    if (bearing >= 337.5 || bearing < 22.5) {
      arrowIcon = const Icon(Icons.arrow_upward_rounded);
    } else if (bearing >= 22.5 && bearing < 67.5) {
      arrowIcon = const Icon(Icons.arrow_outward_rounded);
    } else if (bearing >= 67.5 && bearing < 112.5) {
      arrowIcon = const Icon(Icons.arrow_outward_rounded);
    } else if (bearing >= 112.5 && bearing < 157.5) {
      arrowIcon = const Icon(Icons.subdirectory_arrow_right_rounded);
    } else if (bearing >= 157.5 && bearing < 202.5) {
      arrowIcon = const Icon(Icons.arrow_downward_rounded);
    } else if (bearing >= 202.5 && bearing < 247.5) {
      arrowIcon = const Icon(Icons.subdirectory_arrow_left_rounded);
    } else if (bearing >= 247.5 && bearing < 292.5) {
      arrowIcon = const Icon(Icons.arrow_back_rounded);
    } else {
      arrowIcon = const Icon(Icons.arrow_upward_rounded);
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    touristItem.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${touristItem.getDistance(_sampleLocation)} meters away',
                  ),
                  const SizedBox(height: 10),
                  arrowIcon,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
