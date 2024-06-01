import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/cubit/get_waether_cubit.dart';
import 'package:weather_app/widgets/weatherInfo.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Center(
        child: TextField(
          controller: TextEditingController(),
          cursorColor: Theme.of(context).primaryColor,
          onSubmitted: (value) async {
            BlocProvider.of<GetWaetherCubit>(context)
                .getWeather(cityName: value);

            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => WeatherInfo(),
              ),
            );
            TextEditingController().clear();
            setState(() {});
          },
          decoration: InputDecoration(
            labelText: 'search',
            labelStyle: const TextStyle(
              color: Color.fromARGB(255, 68, 68, 68),
            ),
            hintText: 'enter city name',
            suffixIcon: const Icon(Icons.search),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
