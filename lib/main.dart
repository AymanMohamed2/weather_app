import 'package:flutter/material.dart';
import 'package:weather_app/cubits/get_weather_cubit/cubit/get_waether_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/views/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWaetherCubit(),
      child: BlocBuilder<GetWaetherCubit, GetWaetherState>(
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
              primaryColor: getThemeColor(
                  BlocProvider.of<GetWaetherCubit>(context)
                      .weatherModel
                      ?.weatherCondetion),
            ),
            debugShowCheckedModeBanner: false,
            home: const SplashView(),
          );
        },
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  // ignore: unrelated_type_equality_checks
  if (condition == Null) {
    return Colors.blue;
  }

  switch (condition) {
    case 'Sunny':
      return Colors.orange;
    case 'Partly cloudy':
      return Colors.blue;
    case 'Cloudy':
    case 'Fog':
    case 'Freezing fog':
    case 'Overcast':
      return Colors.grey;

    case 'Mist':
      return Colors.indigo;
    case 'Patchy rain possible':
    case 'Patchy snow possible':
    case 'Patchy sleet possible':
    case 'Patchy freezing drizzle possible':
    case 'Blowing snow':
    case 'Blizzard':
    case 'Patchy light drizzle':
    case 'Light drizzle':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Patchy light snow':
    case 'Light snow':
    case 'Patchy moderate snow':
    case 'Moderate snow':
    case 'Patchy heavy snow':
    case 'Heavy snow':
    case 'Ice pellets':
    case 'Light rain shower':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
    case 'Light snow showers':
    case 'Moderate or heavy snow showers':
      return Colors.lightBlue;

    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.cyan;

    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
      return Colors.amber;

    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
    case 'Clear':
      return Colors.deepPurple;

    default:
      return Colors.blue;
  }
}
