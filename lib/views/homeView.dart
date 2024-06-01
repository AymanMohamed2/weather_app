import 'package:flutter/material.dart';
import 'package:weather_app/cubits/get_weather_cubit/cubit/get_waether_cubit.dart';
import 'package:weather_app/widgets/noWeatherYet.dart';
import 'package:weather_app/widgets/weatherInfo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWaetherCubit, GetWaetherState>(
      builder: (context, state) {
        if (state is Initial) {
          return const NoWeather();
        } else if (state is WeathersuccessState) {
          return const WeatherInfo();
        } else {
          return const Text('opps! there as an error');
        }
      },
    );
  }
}
