import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../injections.dart';
import '../../../tour_packages/presentation/tour_package_detail/tour_package_detail.dart';
import 'bloc/bloc.dart';

class TourItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentDate = DateTime.now();
    final formattedDate = DateFormat('yyyy-MM-dd').format(currentDate);

    return BlocProvider<TourPackageItemBloc>(
      create: (BuildContext context) => TourPackageItemBloc(
        bookingService: serviceLocator(),
      )..add(FetchTourPackageItemEvent()),
      child: BlocBuilder<TourPackageItemBloc, TourPackageItemState>(
        builder: (BuildContext context, TourPackageItemState state) {
          if (state is TourPackageItemLoadedState) {
            final todayBookings = state.bookings
                .where((booking) => booking.tourDate.startsWith(formattedDate))
                .toList();
            final booking =
                todayBookings.isNotEmpty ? todayBookings.first : null;

            return todayBookings.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      color: const Color(0xFF161D2F),
                      elevation: 0, // Sin sombra
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(8),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 8, left: 8),
                              child: Text(
                                booking!.tourPackageTitle,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 8, left: 8),
                              child: Text(
                                booking.agencyName,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xFF5A5A5A)),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TourPackageDetail(
                                          tourPackageId:
                                              booking.tourPackageId)),
                                );
                              },
                              child: const Text(
                                'See more',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        trailing: Container(
                          width: 120,
                          height: 120,
                          child: Center(
                            child: Image.network(
                              booking.imgUrl,
                              width: 200,
                              height: 200,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Card(
                    color: const Color(0xFF161D2F),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(
                        child: Text(
                          "You have no tours for today. Please check your itinerary.",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
          } else if (state is TourPackageItemErrorState) {
            return Center(
              child: Text('Error: ${state.error}'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
