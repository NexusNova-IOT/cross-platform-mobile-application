import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injections.dart';
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
            return ListView.builder(
              itemCount: state.bookings.length,
              itemBuilder: (BuildContext context, int index) {
                final booking = state.bookings[index];
                return ItineraryItem(
                  Title: booking.tourPackageTitle,
                  agency: booking.agencyName,
                  imgUrl: booking.imgUrl,
                  date: booking.tourExperienceDate,
                  tourPackageId: booking.tourPackageId,
                );
              },
            );
          } else if (state is BookingListErrorState) {
            return Center(
              child: Text('Error: ${state.error}'),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}