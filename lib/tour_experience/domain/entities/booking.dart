import 'package:equatable/equatable.dart';

class Booking extends Equatable {
  Booking({
    required this.tourPackageId,
    required this.tourDate,
    required this.tourPackageTitle,
    required this.agencyName,
    required this.imgUrl,
  });

  final int tourPackageId;
  final String tourDate;
  final String tourPackageTitle;
  final String agencyName;
  final String imgUrl;

  @override
  List<Object> get props => <Object>[ tourPackageId, tourDate, tourPackageTitle, agencyName, imgUrl];

}