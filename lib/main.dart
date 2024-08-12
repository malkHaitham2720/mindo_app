import 'package:flutter/material.dart';
// import 'package:mindo_app/pages/splash_screen.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    final modeChecker = ref.watch(mode);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: modeChecker ? ThemeDataStyle.lightStyle : ThemeDataStyle.darkStyle,
      home: const WelcomePage(),
    );
  }
}
