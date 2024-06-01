import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/weatherModel.dart';

class WeatherService {
  final String baseURL = 'https://api.weatherapi.com/v1';
  final String apiKey = 'a4cc42682eb04d9e91d194659231908';
  final Dio dio;
  WeatherService({
    required this.dio,
  });

  Future<WeatherModel> getCurrentWeather({required String cityname}) async {
    try {
      Response response = await dio
          .get('$baseURL/forecast.json?key=$apiKey&q=$cityname&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'opps! there was an error, try again later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('opps! there was an error, try again later');
    }
  }
}
