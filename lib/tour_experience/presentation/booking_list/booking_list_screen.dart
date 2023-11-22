import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injections.dart';
import '../../domain/entities/booking.dart';
import '../../infraestructure/repositories/widgets/ItineraryItem.dart';
import 'bloc/bloc.dart';
import '../../presentation/booking_list/bloc/booking_list_bloc.dart';

class BookingListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookingListBloc>(
      create: (BuildContext context) =>
          serviceLocator<BookingListBloc>()..add(FetchBookingListEvent()),
      child: BlocBuilder<BookingListBloc, BookingListState>(
        builder: (BuildContext context, BookingListState state) {
          if (state is BookingListLoadedState) {
            final List<Booking> filteredBookings = state.bookings;

            if (filteredBookings.isEmpty) {
              return const Center(
                child: Card(
                  color: Color(0xFF161D2F),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "There's no bookings to show.",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            }

            return ListView.builder(
              itemCount: filteredBookings.length,
              itemBuilder: (BuildContext context, int index) {
                final booking = filteredBookings[index];
                return ItineraryItem(
                  Title: booking.tourPackageTitle,
                  agency: booking.agencyName,
                  imgUrl: booking.imgUrl,
                  date: booking.tourDate,
                  tourPackageId: booking.tourPackageId,
                );
              },
            );
          } else if (state is BookingListErrorState) {
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

  bool isFutureDate(String date) {
    final DateTime tourDate = DateTime.parse(date);
    final now = DateTime.now();
    return tourDate.isAfter(now) || tourDate.isAtSameMomentAs(now);
  }
}
