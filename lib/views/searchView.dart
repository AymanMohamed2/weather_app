import 'package:flutter/material.dart';
import 'package:weather_app/widgets/custom_textt_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          title: const Center(
            child: Text(
              'Search a City',
            ),
          ),
        ),
        body: const CustomTextField());
  }
}
