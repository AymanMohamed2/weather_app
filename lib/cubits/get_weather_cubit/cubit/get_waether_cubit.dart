// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../models/weatherModel.dart';
import '../../../services/weatherService.dart';

part 'get_waether_state.dart';

class GetWaetherCubit extends Cubit<GetWaetherState> {
  GetWaetherCubit() : super(Initial());
  WeatherModel? weatherModel;

  getWeather({required String cityName}) async {
    try {
      weatherModel = await WeatherService(dio: Dio())
          .getCurrentWeather(cityname: cityName);

      emit(WeathersuccessState());
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
