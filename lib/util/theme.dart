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
  ),
  appBarTheme: const AppBarTheme(
    surfaceTintColor: Color(0xFFfdfbff),
    color: Color(0xFFfdfbff),
  ),
  cardTheme: const CardTheme(
    surfaceTintColor: Color(0xFFF0F1F4),
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
  primaryColor: const Color(0xFF1B1B1D),
  scaffoldBackgroundColor: const Color(0xFF1B1B1D),
  colorScheme: const ColorScheme.dark(
    background: Color(0xFF1B1B1D),
    primary: Color(0xFF8BA7DE),
    secondary: Color(0xFF8FA5CC),
  ),
  appBarTheme: const AppBarTheme(
    surfaceTintColor: Color(0xFF1B1B1D),
    color: Color(0xFF1B1B1D),
  ),
  cardTheme: const CardTheme(
    surfaceTintColor: Color(0xFF2A2C31),
    color: Color(0xFF2A2C31),
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: Color(0xFF28292F),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF28292F),
  ),
  bottomAppBarColor: const Color(0xFF28292F),
  navigationBarTheme: NavigationBarThemeData(
      backgroundColor: const Color(0xFF28292F),
      indicatorColor: const Color(0xFF35475B),
      iconTheme: MaterialStateProperty.all(const IconThemeData(
        color: Color(0xFFEAEAEF),
      )),
      labelTextStyle: MaterialStateProperty.all(const TextStyle(
          color: Color(0xFFEAEAEF), fontWeight: FontWeight.w500))),
);
