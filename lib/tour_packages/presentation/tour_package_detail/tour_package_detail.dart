import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_travel/tour_packages/infraestructure/data_sources/tourist_list_data_provider.dart';
import '../../../common/widgets/life_travel_app_bar.dart';
import '../../../injections.dart';
import '../../../profile_management/domain/entities/tourist_profile.dart';
import '../../domain/entities/tour_package.dart';
import 'bloc/tour_package_detail_bloc.dart';
import 'bloc/tour_package_detail_event.dart';
import 'bloc/tour_package_detail_state.dart';
import 'map.dart';

class TourPackageDetail extends StatefulWidget {
  final int tourPackageId;

  const TourPackageDetail({
    super.key,
    required this.tourPackageId,
  });

  @override
  State<TourPackageDetail> createState() => _TourPackageDetailState();
}

class _TourPackageDetailState extends State<TourPackageDetail> {
  TourListDataProvider tourListDataProvider = TourListDataProvider();
  // List<TouristProfile> touristList = [];
  @override
  void initState() {
    // getTouristList();
    super.initState();
  }

  // void getTouristList() async {
  //   touristList = await tourListDataProvider.getTourList(widget.tourPackageId);
  //   print("TouristListLenght: " + touristList.length.toString());
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TourPackageDetailBloc>(
      create: (BuildContext context) => TourPackageDetailBloc(
        tourPackageService: serviceLocator(),
      )..add(FetchTourPackageDetailEvent(tourPackageId: widget.tourPackageId)),
      child: BlocBuilder<TourPackageDetailBloc, TourPackageDetailState>(
        builder: (BuildContext context, TourPackageDetailState state) {
          if (state is TourPackageDetailLoadedState) {
            final TourPackage tourPackage = state.tourPackage;

            return Scaffold(
              appBar: const LifeTravelAppBar(),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
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
                                      style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    const Text(
                                      'Departments of Peru:',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      tourPackage.destiny,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    const Text(
                                      'Description:',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      tourPackage.description,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    const Text(
                                      'Meeting Point:',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 300,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: MapA(
                                          latitude:
                                              tourPackage.meetingPointLatitude,
                                          longitude:
                                              tourPackage.meetingPointLongitude,
                                        ),
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
            return const Scaffold(
              appBar: LifeTravelAppBar(),
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
