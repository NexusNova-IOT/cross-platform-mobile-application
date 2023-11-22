import 'package:life_travel/tour_experience/domain/entities/tour_package.dart';

abstract class TourPackageRepository {
  Future<List<TourPackage>> fetchAllTourPackages();
  Future<TourPackage> getPackageById(int id);
}