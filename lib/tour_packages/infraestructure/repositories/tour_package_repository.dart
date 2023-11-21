import 'package:life_travel/tour_packages/domain/entities/tour_package.dart';

import '../../domain/interfaces/tour_package_interface.dart';
import '../data_sources/tour_package_data_provider.dart';

class TourPackageRepositoryImpl implements TourPackageRepository {
  final TourPackageDataProvider dataProvider;

  TourPackageRepositoryImpl({required this.dataProvider});

  @override
  Future<List<TourPackage>> fetchAllTourPackages() async {
    try {
      final List<TourPackage> tourPackages =
          await dataProvider.fetchTourPackages();
      return tourPackages;
    } catch (e) {
      throw Exception('Failed to fetch tour packages: $e');
    }
  }

  @override
  Future<TourPackage> getPackageById(int id) async {
    try {
      final TourPackage tourPackage = await dataProvider.getTourPackage(id);
      print(tourPackage);
      return tourPackage;
    } catch (e) {
      throw Exception('Failed to get tour package with ID $id: $e');
    }
  }
}
