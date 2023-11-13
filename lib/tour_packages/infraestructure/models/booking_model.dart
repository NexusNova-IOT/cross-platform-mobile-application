import '../../domain/entities/booking.dart';

class BookingModel extends Booking {
  BookingModel({
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

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
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