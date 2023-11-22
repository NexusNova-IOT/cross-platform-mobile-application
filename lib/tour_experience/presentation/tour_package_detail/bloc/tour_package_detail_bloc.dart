import 'package:bloc/bloc.dart';
import 'package:life_travel/tour_experience/presentation/tour_package_detail/bloc/tour_package_detail_event.dart';
import 'package:life_travel/tour_experience/presentation/tour_package_detail/bloc/tour_package_detail_state.dart';

import '../../../application/tour_package_facade_service.dart';
import '../../../domain/entities/tour_package.dart';

class TourPackageDetailBloc
    extends Bloc<TourPackageDetailEvent, TourPackageDetailState> {
  final TourPackageFacadeService tourPackageService;

  TourPackageDetailBloc({required this.tourPackageService})
      : super(InitialTourPackageDetailState()) {
    on<FetchTourPackageDetailEvent>(_mapFetchTourPackageEventToState);
  }

  void _mapFetchTourPackageEventToState(
    FetchTourPackageDetailEvent event,
    Emitter<TourPackageDetailState> emit,
  ) async {
    try {
      final TourPackage tourPackage =
          await tourPackageService.getTourPackageById(event.tourPackageId);
      emit(TourPackageDetailLoadedState(tourPackage));
    } catch (e) {
      emit(TourPackageDetailErrorState("Error fetching tour package: $e"));
    }
  }
}
