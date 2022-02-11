import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//CLARO
ThemeData light = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFFFFFFFF),
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  colorScheme: ColorScheme.light(
    background: const Color(0xFFFFFFFF),
    primary: Colors.blueAccent.shade400,
    secondary: Colors.blueAccent.shade400,
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: Color(0xFFFFFFFF),
  ),
  appBarTheme: const AppBarTheme(
      color: Color(0xFFFFFFFF),
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFF050505)),
      titleTextStyle: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xFF000000))),
  cardTheme: const CardTheme(
    color: Color(0xFFF0F1F4),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFEAEBEF),
    selectedItemColor: Colors.blueAccent,
  ),
  bottomAppBarColor: const Color(0xFFEAEBEF),
  navigationBarTheme: NavigationBarThemeData(
      backgroundColor: const Color(0xFFEAEBEF),
      indicatorColor: Colors.blueAccent,
      iconTheme: MaterialStateProperty.all(const IconThemeData(
        color: Color(0xFF050505),
      )),
      labelTextStyle: MaterialStateProperty.all(const TextStyle(
          color: Color(0xFF050505), fontWeight: FontWeight.w500))),
);

//ESCURO
ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF202126),
  scaffoldBackgroundColor: const Color(0xFF202126),
  colorScheme: const ColorScheme.dark(
      background: Color(0xFF202126),
      primary: Color(0xFF8BA7DE),
      secondary: Color(0xFF8BA7DE),
  ),
  appBarTheme: const AppBarTheme(
      color: Color(0xFF202126),
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFFF5F5F5)),
      titleTextStyle: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xFFFFFFFF))),
  cardTheme: const CardTheme(
    color: Color(0xFF2A2C31),
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: Color(0xFF202126),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF15161A),
  ),
  bottomAppBarColor: const Color(0xFF15161A),
  navigationBarTheme: NavigationBarThemeData(
      backgroundColor: const Color(0xFF15161A),
      indicatorColor: const Color(0xFF7592CC),
      iconTheme: MaterialStateProperty.all(const IconThemeData(
        color: Color(0xFFEAEAEA),
      )),
      labelTextStyle: MaterialStateProperty.all(const TextStyle(
          color: Color(0xFFEAEAEA), fontWeight: FontWeight.w500))),
);

class ThemeNotifier extends ChangeNotifier {
  final String key = 'valorTema';
  late SharedPreferences prefs;
  late bool _darkTheme;

  bool get darkTheme => _darkTheme;

  ThemeNotifier() {
    _darkTheme = true;
    _loadFromPrefs();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = prefs.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    prefs.setBool(key, _darkTheme);
  }
}
