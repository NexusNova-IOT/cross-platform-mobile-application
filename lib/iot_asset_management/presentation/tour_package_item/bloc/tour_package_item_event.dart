import 'package:equatable/equatable.dart';

abstract class TourPackageItemEvent extends Equatable {
  const TourPackageItemEvent();
}

class FetchTourPackageItemEvent extends TourPackageItemEvent {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return 'FetchTourPackageItemEvent';
  }
}