import 'package:equatable/equatable.dart';
import 'package:life_travel/tour_packages/domain/entities/tour_package.dart';

abstract class TourPackageDetailState extends Equatable {
  const TourPackageDetailState();
}

class InitialTourPackageDetailState extends TourPackageDetailState {
  @override
  List<Object> get props => [];
}

class TourPackageDetailLoadedState extends TourPackageDetailState {
  TourPackageDetailLoadedState(this.tourPackage);
  final TourPackage tourPackage;

  @override
  List<Object> get props => [tourPackage];

  @override
  String toString() {
    return 'TourPackageDetailLoadedState: $tourPackage';
  }
}

class TourPackageDetailErrorState extends TourPackageDetailState {
  final String error;

  TourPackageDetailErrorState(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() {
    return 'TourPackageDetailErrorState: $error';
  }
}