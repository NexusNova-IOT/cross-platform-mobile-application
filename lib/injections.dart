import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:life_travel/iot_asset_management/presentation/weather_iot_detail/bloc/bloc.dart';
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

import 'iot_asset_management/application/iot_weather_facade_service.dart';
import 'iot_asset_management/domain/interfaces/iot_weather_interface.dart';
import 'iot_asset_management/infraestructure/data_sources/iot_weather_data_provider.dart';
import 'iot_asset_management/infraestructure/repositories/iot_weather_repository.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  // Booking
  bookingDependencies();

  // Tour Packages
  tourPackageDependencies();

  // Iot Weather
  iotWeatherDependencies();
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

Future<void> iotWeatherDependencies() async {
  // Presentation Layer - Blocs
  serviceLocator.registerFactory(
        () => IotWeatherDetailBloc(
      iotWeatherService: serviceLocator(),
    ),
  );

  // Application Layer - facades
  serviceLocator.registerLazySingleton(
        () => IotWeatherFacadeService(
          iotWeatherRepository: serviceLocator<IotWeatherRepository>(),
    ),
  );

  // Infrastructure Layer
  serviceLocator.registerLazySingleton(
        () => IotWeatherDataProvider(),
  );

  serviceLocator.registerLazySingleton<IotWeatherRepository>(
        () => IotWeatherRepositoryImpl(
      dataProvider: serviceLocator<IotWeatherDataProvider>(),
    ),
  );
}
