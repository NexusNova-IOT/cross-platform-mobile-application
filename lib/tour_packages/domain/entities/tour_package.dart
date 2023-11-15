import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class TourPackage extends Equatable {
    TourPackage({
        required this.id,
        required this.title,
        required this.departmentName,
        required this.description,
        required this.imgUrl,
        required this.rating,
        required this.meetingPointLatitude,
        required this.meetingPointLongitude,
    });

    final int id;
    final String title;
    final String departmentName;
    final String description;
    final String imgUrl;
    final double rating;
    final double meetingPointLatitude;
    final double meetingPointLongitude;

    @override
    List<Object> get props => <Object>[
        id,
        title,
        departmentName,
        description,
        imgUrl,
        rating,
        meetingPointLatitude,
        meetingPointLongitude,
    ];
}