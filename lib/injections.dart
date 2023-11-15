import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:life_travel/tour_packages/application/booking_facade_service.dart';
import 'package:life_travel/tour_packages/application/tour_package_facade_service.dart';
import 'package:life_travel/tour_packages/domain/interfaces/booking_interface.dart';
import 'package:life_travel/tour_packages/domain/interfaces/tour_package_interface.dart';
import 'package:life_travel/tour_packages/infraestructure/data_sources/booking_data_provider.dart';
import 'package:life_travel/tour_packages/infraestructure/data_sources/tour_package_data_provider.dart';
import 'package:life_travel/tour_packages/infraestructure/repositories/booking_repository.dart';
import 'package:life_travel/tour_packages/infraestructure/repositories/tour_package_repository.dart';
import 'package:life_travel/tour_packages/presentation/booking_list/bloc/booking_list_bloc.dart';
import 'package:life_travel/tour_packages/presentation/tour_package_detail/bloc/tour_package_detail_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  // Booking
  bookingDependencies();

  // Tour Packages
  tourPackageDependencies();
}

Future<void> bookingDependencies() async {
  // Presentation Layer - Blocs
  serviceLocator.registerFactory(
        () => BookingListBloc(
      bookingService: serviceLocator(),
    ),
  );

  // Application Layer - facades
  serviceLocator.registerLazySingleton(
        () => BookingFacadeService(
      bookingRepository: serviceLocator<BookingRepository>(),
    ),
  );


  // Infrastructure Layer
  serviceLocator.registerLazySingleton(
        () => BookingDataProvider(
    ),
  );

  serviceLocator.registerLazySingleton<BookingRepository>(
        () => BookingRepositoryImpl(
          dataProvider: serviceLocator<BookingDataProvider>(),
        ),
  );

  // Common and core
  serviceLocator.registerLazySingleton(
        () => http.Client(),
  );
}

Future<void> tourPackageDependencies() async {
  // Presentation Layer - Blocs
  serviceLocator.registerFactory(
        () => TourPackageDetailBloc(
      tourPackageService: serviceLocator(),
    ),
  );

  // Application Layer - facades
  serviceLocator.registerLazySingleton(
        () => TourPackageFacadeService(
      tourPackageRepository: serviceLocator<TourPackageRepository>(),
    ),
  );

  // Infrastructure Layer
  serviceLocator.registerLazySingleton(
        () => TourPackageDataProvider(),
  );

  serviceLocator.registerLazySingleton<TourPackageRepository>(
        () => TourPackageRepositoryImpl(
      dataProvider: serviceLocator<TourPackageDataProvider>(),
    ),
  );
}
