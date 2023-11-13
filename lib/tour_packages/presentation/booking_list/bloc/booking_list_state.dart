import 'package:equatable/equatable.dart';
import '../../../domain/entities/booking.dart';

abstract class BookingListState extends Equatable {
  const BookingListState();
}

class InitialBookingListState extends BookingListState {
  @override
  List<Object> get props => [];
}

class BookingListLoadedState extends BookingListState {
  BookingListLoadedState(this.bookings);
  final List<Booking> bookings;

  @override
  List<Object> get props => <List<Booking>>[bookings];

  @override
  String toString() {
    return 'BookingListLoadedState total: ${bookings.length}';
  }
}

class BookingListErrorState extends BookingListState {
  final String error;

  BookingListErrorState(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() {
    return 'BookingListErrorState: $error';
  }
}