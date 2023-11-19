import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_travel/iot_asset_management/presentation/weather_iot_detail/bloc/bloc.dart';
import '../../../../common/config/local_storage.dart';
import '../../../application/iot_weather_facade_service.dart';
import '../../../domain/entities/iot_weather.dart';

class IotWeatherDetailBloc extends Bloc<IotWeatherDetailEvent, IotWeatherDetailState> {
  final IotWeatherFacadeService iotWeatherService;

  IotWeatherDetailBloc({required this.iotWeatherService}) : super(InitialIotWeatherDetailState()){
    on<FetchIotWeatherDetailEvent>(_mapFetchIotWeatherEventToState);
  }

  void _mapFetchIotWeatherEventToState(
      FetchIotWeatherDetailEvent event,
      Emitter<IotWeatherDetailState> emit,
      ) async {
    try {
      final String touristId = LocalStorage.sharedPreferences.getString('userId') ?? "";

      final IotWeather iotWeather = await iotWeatherService.getIotWeatherInfoByTouristId(touristId);
      emit(IotWeatherDetailLoadedState(iotWeather));
    } catch (e) {
      emit(IotWeatherDetailErrorState("Error fetching iot Weather info: $e"));
    }
  }
}