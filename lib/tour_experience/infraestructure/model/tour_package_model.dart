import 'package:life_travel/tour_experience/domain/entities/tour_package.dart';
import 'package:meta/meta.dart';

class TourPackageModel extends TourPackage {
  TourPackageModel({
    required int id,
    required String title,
    required String destiny,
    required String description,
    required String imgUrl,
    required double meetingPointLatitude,
    required double meetingPointLongitude,
  }) : super(
          id: id,
          title: title,
          destiny: destiny,
          description: description,
          imgUrl: imgUrl,
          meetingPointLatitude: meetingPointLatitude,
          meetingPointLongitude: meetingPointLongitude,
        );

  factory TourPackageModel.fromJson(Map<String, dynamic> json) {
    return TourPackageModel(
      id: json['id'],
      title: json['title'],
      destiny: json['destiny'],
      description: json['description'],
      imgUrl: json['imgUrl'],
      meetingPointLatitude: json['meetingPointLatitude'],
      meetingPointLongitude: json['meetingPointLongitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'destiny': destiny,
      'description': description,
      'imgUrl': imgUrl,
      'meetingPointLatitude': meetingPointLatitude,
      'meetingPointLongitude': meetingPointLongitude,
    };
  }
}
