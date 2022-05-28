import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  useMaterial3: true,
  textTheme: const TextTheme(
    titleMedium: TextStyle(fontWeight: FontWeight.w400),
  ),
  brightness: Brightness.light,
  primaryColor: const Color(0xFFfdfbff),
  scaffoldBackgroundColor: const Color(0xFFfdfbff),
  colorScheme: ColorScheme.light(
    background: const Color(0xFFfdfbff),
    primary: Colors.blueAccent.shade400,
    secondary: Colors.blueAccent.shade400,
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: Color(0xFFfdfbff),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(28)),
    ),
  ),
  appBarTheme: const AppBarTheme(
      surfaceTintColor: Color(0xFFfdfbff),
      color: Color(0xFFfdfbff),
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFF000000)),
      titleTextStyle: TextStyle(
          fontSize: 22, fontWeight: FontWeight.w400, color: Color(0xFF000000))),
  cardTheme: const CardTheme(
    color: Color(0xFFF0F1F4),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFEAEBEF),
    selectedItemColor: Colors.blueAccent,
  ),
  bottomAppBarColor: const Color(0xFFEAEBEF),
  navigationBarTheme: NavigationBarThemeData(
      backgroundColor: const Color(0xFFE8E9EF),
      indicatorColor: Colors.blueAccent,
      iconTheme: MaterialStateProperty.all(const IconThemeData(
        color: Color(0xFF050505),
      )),
      labelTextStyle: MaterialStateProperty.all(const TextStyle(
          color: Color(0xFF050505), fontWeight: FontWeight.w500))),
);

ThemeData dark = ThemeData(
  useMaterial3: true,
  textTheme: const TextTheme(
    titleMedium: TextStyle(fontWeight: FontWeight.w400),
  ),
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF202124),
  scaffoldBackgroundColor: const Color(0xFF202124),
  colorScheme: const ColorScheme.dark(
    background: Color(0xFF202124),
    primary: Color(0xFF8BA7DE),
    secondary: Color(0xFF8BA7DE),
  ),
  appBarTheme: const AppBarTheme(
      surfaceTintColor: Color(0xFF202124),
      color: Color(0xFF202124),
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
      titleTextStyle: TextStyle(
          fontSize: 22, fontWeight: FontWeight.w400, color: Color(0xFFFFFFFF))),
  cardTheme: const CardTheme(
    color: Color(0xFF2A2C31),
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: Color(0xFF28292D),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(28)),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF28292D),
  ),
  bottomAppBarColor: const Color(0xFF28292D),
  navigationBarTheme: NavigationBarThemeData(
      backgroundColor: const Color(0xFF28292D),
      indicatorColor: const Color(0xFF475F91),
      iconTheme: MaterialStateProperty.all(const IconThemeData(
        color: Color(0xFFEAEAEF),
      )),
      labelTextStyle: MaterialStateProperty.all(const TextStyle(
          color: Color(0xFFEAEAEF), fontWeight: FontWeight.w500))),
);
