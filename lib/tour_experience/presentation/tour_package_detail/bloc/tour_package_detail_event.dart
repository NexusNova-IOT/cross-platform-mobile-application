import 'package:equatable/equatable.dart';

abstract class TourPackageDetailEvent extends Equatable {
  const TourPackageDetailEvent();
}

class FetchTourPackageDetailEvent extends TourPackageDetailEvent {
  final int tourPackageId;

  FetchTourPackageDetailEvent({required this.tourPackageId});

  @override
  List<Object?> get props => [tourPackageId];

  @override
  String toString() {
    return 'FetchTourPackageDetailEvent(tourPackageId: $tourPackageId)';
  }
}