import 'package:equatable/equatable.dart';

import '../../../../tour_packages/domain/entities/booking.dart';
import '../../../../tour_packages/domain/entities/tour_package.dart';

abstract class TourPackageItemState extends Equatable {
  const TourPackageItemState();
}

class InitialTourPackageItemState extends TourPackageItemState {
  @override
  List<Object> get props => [];
}

class TourPackageItemLoadedState extends TourPackageItemState {
  TourPackageItemLoadedState(this.bookings);
  final List<Booking> bookings;

  @override
  List<Object> get props => <List<Booking>>[bookings];

  @override
  String toString() {
    return 'TourPackageItemLoadedState total: ${bookings.length}';
  }
}

class TourPackageItemErrorState extends TourPackageItemState {
  final String error;

  TourPackageItemErrorState(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() {
    return 'TourPackageItemErrorState: $error';
  }
}