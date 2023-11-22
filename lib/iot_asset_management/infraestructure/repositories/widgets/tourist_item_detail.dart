import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:life_travel/iot_asset_management/infraestructure/model/tourist_location_model.dart';

class TouristItemDetail extends StatelessWidget {
  const TouristItemDetail(
      {super.key, required this.touristItem, required this.guideLocation});

  final TouristLocationModel touristItem;
  final LatLng guideLocation;

  @override
  Widget build(BuildContext context) {
    final double bearing = touristItem.calculateBearing(guideLocation);

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
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(touristItem.imgUrl),
          ),
          title: Text(
            touristItem.nombre,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Text(
                '${touristItem.getDistance(guideLocation)} meters away',
              ),
            ],
          ),
          trailing: arrowIcon,
        ),
      ),
    );
  }
}
