import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../common/config/mapbox_credentials.dart';
import '../../../common/utils/user_type.dart';
import '../../../iot_asset_management/infraestructure/repositories/widgets/location_marker.dart';

class MapA extends StatelessWidget {
  final double latitude;
  final double longitude;

  const MapA({
    Key? key,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Marker> markers = _buildMarkers();

    return FlutterMap(
      options: MapOptions(
        minZoom: 10,
        maxZoom: 50,
        initialCenter: LatLng(
          latitude,
          longitude,
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
  }

  List<Marker> _buildMarkers() {
    return [
      Marker(
        point: LatLng(latitude, longitude),
        child: const MyLocationMarker(role: UserType.ROLE_TOURIST),
      ),
    ];
  }
}
