
import 'package:life_travel/tour_packages/domain/entities/tour_package.dart';

import '../domain/interfaces/tour_package_interface.dart';

class TourPackageFacadeService {
  final TourPackageRepository tourPackageRepository;

  TourPackageFacadeService({required this.tourPackageRepository});

  Future<List<TourPackage>> getAllTourPackages() {
    return tourPackageRepository.fetchAllTourPackages();
  }

  Future<TourPackage> getTourPackageById(int id) {
    return tourPackageRepository.getPackageById(id);
  }
}