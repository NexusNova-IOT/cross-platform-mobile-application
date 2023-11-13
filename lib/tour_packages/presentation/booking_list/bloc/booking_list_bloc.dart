import 'dart:async';
import 'package:bloc/bloc.dart';
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
      // "ID_DEL_TURISTA" se debe obtener
      final String touristId = "6WKjj6oyzrMTUfuw8j7vEks3Yuu1";
      final List<Booking> bookings = await bookingService.getBookingByTouristId(touristId);
      emit(BookingListLoadedState(bookings));
    } catch (e) {
      emit(BookingListErrorState("Error fetching booking list: $e"));
    }
  }
}