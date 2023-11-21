import 'package:life_travel/iot_asset_management/presentation/tour_package_item/bloc/tour_package_item_event.dart';
import 'package:life_travel/iot_asset_management/presentation/tour_package_item/bloc/tour_package_item_state.dart';
import 'package:bloc/bloc.dart';
import '../../../../common/config/local_storage.dart';
import '../../../../tour_packages/application/booking_facade_service.dart';
import '../../../../tour_packages/domain/entities/booking.dart';

class TourPackageItemBloc
    extends Bloc<TourPackageItemEvent, TourPackageItemState> {
  final BookingFacadeService bookingService;

  TourPackageItemBloc({required this.bookingService})
      : super(InitialTourPackageItemState()) {
    on<FetchTourPackageItemEvent>(_mapFetchTourPackageItemEventToState);
  }

  void _mapFetchTourPackageItemEventToState(
    FetchTourPackageItemEvent event,
    Emitter<TourPackageItemState> emit,
  ) async {
    try {
      final String touristId =
          LocalStorage.sharedPreferences.getString('userId') ?? "";
      final List<Booking> bookings =
          await bookingService.getBookingByTouristId(touristId);
      emit(TourPackageItemLoadedState(bookings));
    } catch (e) {
      emit(TourPackageItemErrorState("Error fetching booking list: $e"));
    }
  }
}
