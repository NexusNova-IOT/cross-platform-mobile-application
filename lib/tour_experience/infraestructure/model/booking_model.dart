import '../../domain/entities/booking.dart';

class BookingModel extends Booking {
  BookingModel({
    required int tourPackageId,
    required String tourDate,
    required String tourPackageTitle,
    required String agencyName,
    required String imgUrl,
  }) : super(
    tourPackageId: tourPackageId,
    tourDate: tourDate,
    tourPackageTitle: tourPackageTitle,
    agencyName: agencyName,
    imgUrl: imgUrl,
  );

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      tourPackageId: json['tourPackageId'],
      tourDate: json['tourDate'],
      tourPackageTitle: json['tourPackageTitle'],
      agencyName: json['agencyName'],
      imgUrl: json['imgUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tourPackageId': tourPackageId,
      'tourDate': tourDate,
      'tourPackageTitle': tourPackageTitle,
      'agencyName': agencyName,
      'imgUrl': imgUrl,
    };
  }
}