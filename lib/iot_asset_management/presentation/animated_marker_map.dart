import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:life_travel/common/utils/user_type.dart';
import 'package:life_travel/common/widgets/life_travel_app_bar.dart';
import 'package:life_travel/iot_asset_management/infraestructure/data_sources/markers_sample.dart';
import 'package:life_travel/iot_asset_management/infraestructure/repositories/widgets/location_marker.dart';
import 'package:life_travel/iot_asset_management/infraestructure/repositories/widgets/tourist_item_detail.dart';

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
