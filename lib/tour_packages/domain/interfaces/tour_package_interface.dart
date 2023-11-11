import 'package:life_travel/tour_packages/domain/entities/tour_package.dart';

abstract class TourPackageRepository {
  Future<List<TourPackage>> fetchAllTourPacakges();
  Future<TourPackage> getPackageById(int id);
}