import 'dart:async';
import 'package:bloc/bloc.dart';
import '../../../../common/config/local_storage.dart';
import '../../../application/booking_facade_service.dart';
import '../../../domain/entities/booking.dart';
import './bloc.dart';
import 'booking_list_event.dart';
import 'booking_list_state.dart';

class BookingListBloc extends Bloc<BookingListEvent, BookingListState> {
  final BookingFacadeService bookingService;

  BookingListBloc({required this.bookingService}) : super(InitialBookingListState()) {
    on<FetchBookingListEvent>(_mapFetchBookingEventToState);
  }

  void _mapFetchBookingEventToState(
      FetchBookingListEvent event,
      Emitter<BookingListState> emit,
      ) async {
    try {
      final String touristId = LocalStorage.sharedPreferences.getString('userId') ?? "";
      final List<Booking> bookings = await bookingService.getBookingByTouristId(touristId);
      emit(BookingListLoadedState(bookings));
    } catch (e) {
      emit(BookingListErrorState("Error fetching booking list: $e"));
    }
  }
}