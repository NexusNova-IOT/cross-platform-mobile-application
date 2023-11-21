import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:life_travel/common/config/mapbox_credentials.dart';
import 'package:life_travel/common/utils/user_type.dart';
import 'package:life_travel/common/widgets/life_travel_app_bar.dart';
import 'package:life_travel/iot_asset_management/infraestructure/data_sources/gps_data_provider.dart';
import 'package:life_travel/iot_asset_management/infraestructure/models/tourist_location_model.dart';
import 'package:life_travel/iot_asset_management/infraestructure/repositories/tourist_location_repository.dart';
import 'package:life_travel/iot_asset_management/infraestructure/repositories/widgets/location_marker.dart';
import 'package:life_travel/iot_asset_management/infraestructure/repositories/widgets/tourist_item_detail.dart';

class AnimatedMarkerMap extends StatefulWidget {
  const AnimatedMarkerMap({Key? key}) : super(key: key);

  @override
  State<AnimatedMarkerMap> createState() => _AnimatedMarkerMapState();
}

class _AnimatedMarkerMapState extends State<AnimatedMarkerMap> {
  final _pageController = PageController(viewportFraction: 0.8);
  Position? _currentPosition;
  late Timer _positionUpdateTimer;
  late Timer _touristPositionTimer;
  List<Marker> markers = [];

  late List<TouristLocationModel> touristLocations = [];
  final TouristLocationRepositoryImpl touristLocationInterface =
      TouristLocationRepositoryImpl(
    gpsDataProvider: GpsDataProvider(),
  );

  bool showNoDataBanner = false;

  @override
  void initState() {
    super.initState();
    _getCurrentPosition();

    _positionUpdateTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      resetPositions();
      _getCurrentPosition();
    });

    getLocations();

    _touristPositionTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      resetPositions();
      getLocations();
    });
  }

  void getLocations() async {
    try {
      if (touristLocations.isEmpty) {
        setState(() {
          showNoDataBanner = true;
        });
        return;
      }

      touristLocations = await touristLocationInterface.getTouristLocations();

      setState(() {
        showNoDataBanner = touristLocations.isEmpty;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void dispose() {
    _positionUpdateTimer.cancel();
    super.dispose();
  }

  void resetPositions() {
    markers = [];
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
    if (_currentPosition != null) {
      markers.add(
        Marker(
          point:
              LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
          child: const MyLocationMarker(role: UserType.ROLE_AGENCY),
        ),
      );
    }

    for (final touristLocation in touristLocations) {
      markers.add(Marker(
          point: touristLocation.location,
          child: const MyLocationMarker(role: UserType.ROLE_TOURIST)));
    }

    return markers;
  }

  @override
  Widget build(BuildContext context) {
    Widget mapWidget;

    if (_currentPosition != null) {
      if (touristLocations != null) {
        markers = _buildMarkers();

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
                'accessToken': MapBoxCredentials.MAP_BOX_TOKEN,
                'id': MapBoxCredentials.MAPBOX_STYLE,
              },
            ),
            MarkerLayer(markers: markers),
          ],
        );
      } else {
        mapWidget = const Center(child: CircularProgressIndicator());
      }
    } else {
      mapWidget = const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: const LifeTravelAppBar(),
      body: _currentPosition != null
          ? Stack(
              children: [
                mapWidget,
                if (showNoDataBanner)
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.red,
                      child: const Text(
                        'No package is currently active!',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FutureBuilder<List<TouristLocationModel>>(
                    future: touristLocationInterface.getTouristLocations(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Center(
                          child: Text(''),
                        );
                      } else {
                        final touristLocationss = snapshot.data ?? [];
                        touristLocations = snapshot.data ?? [];
                        return SizedBox(
                          height: 153,
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: touristLocationss.length,
                            itemBuilder: (context, index) {
                              final touristItem = touristLocationss[index];
                              return TouristItemDetail(
                                touristItem: touristItem,
                                guideLocation: LatLng(
                                  _currentPosition!.latitude,
                                  _currentPosition!.longitude,
                                ),
                              );
                            },
                          ),
                        );
                      }
                    },
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
