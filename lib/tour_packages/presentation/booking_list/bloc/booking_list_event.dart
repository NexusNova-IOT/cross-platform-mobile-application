import 'package:equatable/equatable.dart';

abstract class BookingListEvent extends Equatable {
  const BookingListEvent();
}

class FetchBookingListEvent extends BookingListEvent {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return 'FetchBookingListEvent';
  }
}