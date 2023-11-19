import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../common/config/mapbox_credentials.dart';
import '../../../common/widgets/life_travel_app_bar.dart';
import '../../../injections.dart';
import '../../domain/entities/tour_package.dart';
import 'bloc/tour_package_detail_bloc.dart';
import 'bloc/tour_package_detail_event.dart';
import 'bloc/tour_package_detail_state.dart';
import 'map.dart';

class TourPackageDetail extends StatelessWidget {
  final int tourPackageId;

  TourPackageDetail({
    required this.tourPackageId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TourPackageDetailBloc>(
      create: (BuildContext context) => TourPackageDetailBloc(
        tourPackageService: serviceLocator(),
      )..add(FetchTourPackageDetailEvent(tourPackageId: tourPackageId)),
      child: BlocBuilder<TourPackageDetailBloc, TourPackageDetailState>(
        builder: (BuildContext context, TourPackageDetailState state) {
          if (state is TourPackageDetailLoadedState) {
            // Usa state.tourPackage para acceder al paquete turístico cargado
            final TourPackage tourPackage = state.tourPackage;

            return Scaffold(
              appBar: const LifeTravelAppBar(),
              body: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 15.0),
                    const Text(
                      'Tour Package Detail',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 15.0),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: const Color(0xFF161D2F),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image.network(
                                  tourPackage.imgUrl,
                                  width: 300,
                                  height: 300,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      tourPackage.title,
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.access_time,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          'Rating: ${tourPackage.rating}',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      'Departamento del Perú:',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      tourPackage.destiny,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      'Descripción:',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      tourPackage.description,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      'Meeting Point:',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      height: 300, // Ajusta la altura del mapa según tus necesidades
                                      child: MapA(
                                        latitude: tourPackage.meetingPointLatitude,
                                        longitude: tourPackage.meetingPointLongitude,
                                      ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else if (state is TourPackageDetailErrorState) {
            return Scaffold(
              appBar: const LifeTravelAppBar(),
              body: Center(
                child: Text('Error: ${state.error}'),
              ),
            );
          } else {
            return Scaffold(
              appBar: const LifeTravelAppBar(),
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
