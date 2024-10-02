import 'package:flutter/material.dart';
// import 'package:mindo_app/pages/splash_screen.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:mindo_app/pages/welcome_page.dart';

import 'package:mindo_app/providers/mode_provider.dart';
import 'package:mindo_app/theme_data.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double h = MediaQuery.of(context).size.width;
    final modeChecker = ref.watch(mode);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: modeChecker
          ? ThemeDataStyle(h).lightStyle
          : ThemeDataStyle(h).darkStyle,
      home: const WelcomePage(),
    );
  }
}
