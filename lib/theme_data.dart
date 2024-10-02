import 'package:flutter/material.dart';

class ThemeDataStyle {
  final double h;

  const ThemeDataStyle(this.h);

  ThemeData get lightStyle => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          surface: Color.fromRGBO(250, 250, 250, 1),
          onSurface: Color(0xff000000),
          primary: Color(0xff4657A7),
          secondary: Color.fromARGB(106, 69, 85, 165),
          onError: Color(0xffFF5341),
          primaryContainer: Color(0xffCDD5F6),
          secondaryContainer: Color(0xffE4E3E3),
          onSecondaryContainer: Color(0xff1C1C1C),
          onPrimaryContainer: Color(0xff1C1C1C),
        ),
        textTheme: TextTheme(
          labelSmall: TextStyle(
            color: const Color.fromARGB(255, 128, 135, 138),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w200,
            fontSize: h * 0.038,
          ),
          labelMedium: TextStyle(
            color: const Color(0xffFFFFFF),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.normal,
            fontSize: h * 0.04,
          ),
          bodyMedium: TextStyle(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: h * 0.05,
          ),
          headlineLarge: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w900,
            fontSize: h * 0.12,
          ),
          headlineMedium: TextStyle(
            color: const Color(0xff96A7AF),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            fontSize: h * 0.05,
          ),
          headlineSmall: TextStyle(
            color: const Color(0xff96A7AF),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            fontSize: h * 0.03,
          ),
        ),
        cardColor: const Color.fromARGB(255, 255, 255, 255),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff91A1ED),
        ),
      );
  ThemeData get darkStyle => ThemeData(
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
