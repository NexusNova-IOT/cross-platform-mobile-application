import 'package:life_travel/tour_packages/domain/entities/tour_package.dart';
import 'package:meta/meta.dart';

class TourPackageModel extends TourPackage {
  TourPackageModel({
    required int id,
    required String title,
    required String departmentName,
    required String description,
    required String imgUrl,
    required double rating,
    required double meetintPointLatitude,
    required double meetintPointLongitude,
  }) : super(
          id: id,
          title: title,
          departmentName: departmentName,
          description: description,
          imgUrl: imgUrl,
          rating: rating,
          meetintPointLatitude: meetintPointLatitude,
          meetintPointLongitude: meetintPointLongitude,
        );

  factory TourPackageModel.fromJson(Map<String, dynamic> json) {
    return TourPackageModel(
      id: json['id'],
      title: json['title'],
      departmentName: json['departmentName'],
      description: json['description'],
      imgUrl: json['imgUrl'],
      rating: json['rating'],
      meetintPointLatitude: json['meetintPointLatitude'],
      meetintPointLongitude: json['meetintPointLongitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'departmentName': departmentName,
      'description': description,
      'imgUrl': imgUrl,
      'rating': rating,
      'meetintPointLatitude': meetintPointLatitude,
      'meetintPointLongitude': meetintPointLongitude,
    };
  }
}