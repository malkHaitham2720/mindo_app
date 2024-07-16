import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Column(
      children: [
        Image.asset(
          'assets/images/splash_screen_images/light_logo.png',
          height: h * 0.243,
          width: w * 0.353,
          filterQuality: FilterQuality.high,
          fit: BoxFit.contain,
        ),
        SizedBox(
          height: h * 0.1,
        ),
        Image.asset(
          'assets/images/splash_screen_images/loading gif in light mode.gif',
          height: h * 0.15,
          width: w * 0.120,
          filterQuality: FilterQuality.high,
          fit: BoxFit.contain,
        ),
      ],
    ));
  }
}
