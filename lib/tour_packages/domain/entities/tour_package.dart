import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class TourPackage extends Equatable {
  TourPackage({
    required this.id,
    required this.title,
    required this.destiny,
    required this.description,
    required this.imgUrl,
    required this.meetingPointLatitude,
    required this.meetingPointLongitude,
  });

  final int id;
  final String title;
  final String destiny;
  final String description;
  final String imgUrl;
  final double meetingPointLatitude;
  final double meetingPointLongitude;

  @override
  List<Object> get props => <Object>[
        id,
        title,
        destiny,
        description,
        imgUrl,
        meetingPointLatitude,
        meetingPointLongitude,
      ];
}
