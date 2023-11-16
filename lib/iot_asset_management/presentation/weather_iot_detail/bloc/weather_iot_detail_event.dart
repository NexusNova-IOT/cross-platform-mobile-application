import 'package:equatable/equatable.dart';

abstract class IotWeatherDetailEvent extends Equatable {
  const IotWeatherDetailEvent();
}

class FetchIotWeatherDetailEvent extends IotWeatherDetailEvent {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return 'FetchIotWeatherDetailEvent';
  }
}