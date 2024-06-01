import 'package:flutter/material.dart';
import 'package:weather_app/views/homeView.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AspectRatio(
          aspectRatio: 5 / 2.5,
          child: Image.asset('assets/images/weatherLogo.png'),
        ), 
      ],
    );
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const HomeView(),
          ),
        );
      },
    );
  }
}
