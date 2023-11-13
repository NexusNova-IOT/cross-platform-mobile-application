import 'package:equatable/equatable.dart';

class Booking extends Equatable {
  Booking({
    required this.id,
    required this.tourPackageId,
    required this.tourExperienceDate,
    required this.tourPackageTitle,
    required this.agencyName,
    required this.imgUrl,
  });

  final int id;
  final int tourPackageId;
  final DateTime tourExperienceDate;
  final String tourPackageTitle;
  final String agencyName;
  final String imgUrl;

  @override
  List<Object> get props => <Object>[id, tourPackageId, tourExperienceDate, tourPackageTitle, agencyName, imgUrl];

}