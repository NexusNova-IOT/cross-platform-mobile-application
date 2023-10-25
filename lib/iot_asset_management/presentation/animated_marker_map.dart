import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:life_travel/common/utils/user_type.dart';
import 'package:life_travel/common/widgets/life_travel_app_bar.dart';
import 'package:life_travel/iot_asset_management/infraestructure/models/map_marker.dart';

const MAP_BOX_TOKEN =
    'pk.eyJ1IjoicnlhbnN3ZWRlbiIsImEiOiJjbDI0emlqZ2gwNG42M2lwZzdsM2k1N2w2In0.t8q9bDscpRha_4kXK1kdyg';

const MAPBOX_STYLE = 'mapbox/dark-v11';
const MARKER_COLOR = Colors.redAccent;
const _sampleLocation = LatLng(-12.115396, -76.871283);

class AnimatedMarkerMap extends StatefulWidget {
  const AnimatedMarkerMap({Key? key}) : super(key: key);

  @override
  State<AnimatedMarkerMap> createState() => _AnimatedMarkerMapState();
}

class _AnimatedMarkerMapState extends State<AnimatedMarkerMap> {
  final _pageController = PageController(viewportFraction: 0.8);

  List<Marker> _buildMarkers() {
    return touristSample.map((touristItem) {
      return Marker(
        point: touristItem.location,
        child: const MyLocationMarker(role: UserType.tourist),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final _markers = _buildMarkers();
    return Scaffold(
      appBar: const LifeTravelAppBar(),
      body: Stack(children: [
        FlutterMap(
          options: const MapOptions(
            minZoom: 10,
            maxZoom: 50,
            initialCenter: _sampleLocation,
            initialZoom: 20,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://api.mapbox.com/styles/v1/'
                  '{id}/tiles/{z}/{x}/{y}@2x?access_token={accessToken}',
              additionalOptions: const {
                'accessToken': MAP_BOX_TOKEN,
                'id': MAPBOX_STYLE,
              },
            ),
            MarkerLayer(markers: _markers),
            const MarkerLayer(
              markers: [
                Marker(
                    point: _sampleLocation,
                    child: MyLocationMarker(
                      role: UserType.guide,
                    )),
              ],
            )
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 153,
            child: PageView.builder(
              controller: _pageController,
              itemCount: touristSample.length,
              itemBuilder: (context, index) {
                final touristItem = touristSample[index];
                return TouristItemDetail(touristItem: touristItem);
              },
            ),
          ),
        ),
      ]),
    );
  }
}

class MyLocationMarker extends StatelessWidget {
  const MyLocationMarker({Key? key, required this.role}) : super(key: key);

  final UserType role;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: role == UserType.guide
          ? Container(
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: const Icon(Icons.tour, size: 30, color: Colors.amber),
            )
          : role == UserType.tourist
              ? Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                )
              : null,
    );
  }
}

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
