import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindo_app/providers/mode_provider.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modechecker = ref.watch(mode);

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:
          modechecker ? const Color(0xff91A1ED) : const Color(0xff4555A5),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              modechecker
                  ? 'assets/images/splash_screen_images/light_logo.png'
                  : 'assets/images/splash_screen_images/dark_logo.png',
              height: h * 0.4,
              width: w * 0.85,
              filterQuality: FilterQuality.high,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.only(left: h * 0.016),
              child: Image.asset(
                modechecker
                    ? 'assets/images/splash_screen_images/loading gif in light mode.gif'
                    : 'assets/images/splash_screen_images/loding gif in dark mode.gif',
                width: w * 0.45,
                filterQuality: FilterQuality.high,
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
