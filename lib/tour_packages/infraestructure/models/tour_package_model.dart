import 'package:life_travel/tour_packages/domain/entities/tour_package.dart';
import 'package:meta/meta.dart';

class TourPackageModel extends TourPackage {
  TourPackageModel({
    required int id,
    required int tourPackageId,
    required DateTime tourExperienceDate,
    required String tourPackageTitle,
    required String agencyName,
    required String imgUrl,
  }) : super(
          id: id,
          tourPackageId: tourPackageId,
          tourExperienceDate: tourExperienceDate,
          tourPackageTitle: tourPackageTitle,
          agencyName: agencyName,
          imgUrl: imgUrl,
        );

  factory TourPackageModel.fromJson(Map<String, dynamic> json) {
    return TourPackageModel(
      id: json['id'],
      tourPackageId: json['tourPackageId'],
      tourExperienceDate: json['tourExperienceDate'],
      tourPackageTitle: json['tourPackageTitle'],
      agencyName: json['agencyName'],
      imgUrl: json['imgUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tourPackageId': tourPackageId,
      'tourExperienceDate': tourExperienceDate,
      'tourPackageTitle': tourPackageTitle,
      'agencyName': agencyName,
      'imgUrl': imgUrl,
    };
  }
}