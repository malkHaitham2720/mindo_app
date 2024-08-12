import 'package:flutter/material.dart';

class ThemeDataStyle {
  static ThemeData lightStyle = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      surface: Color(0xffFAFAFA),
      onSurface: Color(0xff000000),
      primary: Color(0xff4657A7),
      secondary: Color.fromARGB(106, 69, 85, 165),
      onError: Color(0xffFF5341),
      primaryContainer: Color(0xffCDD5F6),
      secondaryContainer: Color(0xffE4E3E3),
      onSecondaryContainer: Color(0xff1C1C1C),
      onPrimaryContainer: Color(0xff1C1C1C),
    ),
    cardColor: const Color.fromARGB(255, 255, 255, 255),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff91A1ED),
    ),
  );
  static ThemeData darkStyle = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      surface: Color(0xff1C1C1C),
      primary: Color(0xff91A1ED),
      secondary: Color(0xff2D3456),
      onError: Color(0xffC76A75),
      onSurface: Color(0xffffffff),
      primaryContainer: Color(0xff2D3559),
      secondaryContainer: Color(0xff979797),
      onSecondaryContainer: Color(0xff1C1C1C),
      onPrimaryContainer: Color(0xffFDFEFF),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff45549C),
    ),
  );
}
