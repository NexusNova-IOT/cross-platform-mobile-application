import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:life_travel/common/utils/user_type.dart';
import 'package:life_travel/common/widgets/life_travel_app_bar.dart';
import 'package:life_travel/iot_asset_management/infraestructure/data_sources/markers_sample.dart';
import 'package:life_travel/iot_asset_management/infraestructure/repositories/widgets/location_marker.dart';
import 'package:life_travel/iot_asset_management/infraestructure/repositories/widgets/tourist_item_detail.dart';

const MAP_BOX_TOKEN =
    'pk.eyJ1IjoicnlhbnN3ZWRlbiIsImEiOiJjbDI0emlqZ2gwNG42M2lwZzdsM2k1N2w2In0.t8q9bDscpRha_4kXK1kdyg';

const MAPBOX_STYLE = 'mapbox/dark-v11';

class AnimatedMarkerMap extends StatefulWidget {
  const AnimatedMarkerMap({Key? key}) : super(key: key);

  @override
  State<AnimatedMarkerMap> createState() => _AnimatedMarkerMapState();
}

class _AnimatedMarkerMapState extends State<AnimatedMarkerMap> {
  final _pageController = PageController(viewportFraction: 0.8);
  Position? _currentPosition;
  late Timer _positionUpdateTimer;

  @override
  void initState() {
    super.initState();
    _getCurrentPosition();

    _positionUpdateTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      _getCurrentPosition();
    });
  }

  @override
  void dispose() {
    _positionUpdateTimer.cancel();
    super.dispose();
  }

  Future<void> _getCurrentPosition() async {
    try {
      final hasPermission = await _handleLocationPermission();

      if (!hasPermission) return;
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _currentPosition = position;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  List<Marker> _buildMarkers() {
    final List<Marker> markers = [];

    if (_currentPosition != null) {
      markers.add(
        Marker(
          point:
              LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
          child: const MyLocationMarker(role: UserType.guide),
        ),
      );
    }
    markers.addAll(touristSample.map((touristItem) {
      return Marker(
        point: touristItem.location,
        child: const MyLocationMarker(role: UserType.tourist),
      );
    }));
    return markers;
  }

  @override
  Widget build(BuildContext context) {
    final markers = _buildMarkers();

    Widget mapWidget;

    if (_currentPosition != null) {
      mapWidget = FlutterMap(
        options: MapOptions(
          minZoom: 10,
          maxZoom: 50,
          initialCenter: LatLng(
            _currentPosition!.latitude,
            _currentPosition!.longitude,
          ),
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
          MarkerLayer(markers: markers),
        ],
      );
    } else {
      mapWidget = const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: const LifeTravelAppBar(),
      body: _currentPosition != null
          ? Stack(
              children: [
                mapWidget,
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 153,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: touristSample.length,
                      itemBuilder: (context, index) {
                        final touristItem = touristSample[index];
                        return TouristItemDetail(
                          touristItem: touristItem,
                          guideLocation: LatLng(
                            _currentPosition!.latitude,
                            _currentPosition!.longitude,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
