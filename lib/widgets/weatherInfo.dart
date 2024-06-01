import 'package:flutter/material.dart';
import 'package:weather_app/cubits/get_weather_cubit/cubit/get_waether_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWaetherCubit>(context).weatherModel;
    return BlocBuilder<GetWaetherCubit, GetWaetherState>(
      builder: (context, state) {
        if (state is WeathersuccessState) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 10,
              backgroundColor: Theme.of(context).primaryColor,
              title: const Center(
                child: Text(
                  'Searching Result',
                ),
              ),
            ),
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Colors.white,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      weatherModel!.cityName,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 20, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Image.network('https:${weatherModel.image}'),
                          ),
                          const SizedBox(),
                          Text(
                            '${weatherModel.temp.round()}°',
                            style: const TextStyle(
                                fontSize: 40, fontWeight: FontWeight.w500),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'max temp: ${weatherModel.maxTemp.round()}°',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'min temp: ${weatherModel.minTemp.round()}°',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Text(
                      '* ${weatherModel.weatherCondetion} *',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Search Again',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.3),
            ),
          );
        }
      },
    );
  }
}
