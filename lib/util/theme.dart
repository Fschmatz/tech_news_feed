import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//CLARO
ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColorBrightness: Brightness.dark,
    primaryColor: const Color(0xFFFFFFFF),
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    colorScheme: const ColorScheme.light(
      background: Color(0xFFFFFFFF),
      primary: Colors.blueAccent,
      secondary: Colors.blueAccent,
      secondaryVariant: Colors.blueAccent,
    ),
    appBarTheme: const AppBarTheme(
        color: Color(0xFFFFFFFF),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF050505)),
        titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF000000))),
    cardTheme: const CardTheme(
      color: Color(0xFFF1F2F7),
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Color(0xFFFFFFFF),
    ),
    inputDecorationTheme: InputDecorationTheme(
        contentPadding:
        const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFF7592CC),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(10.0)),
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(10.0))),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFFEAEBEE),
      selectedItemColor: Colors.blueAccent,
    ),
    bottomAppBarColor: const Color(0xFFEAEBEE),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: const Color(0xFFEAEBEE),
        indicatorColor: Colors.blueAccent,
        iconTheme: MaterialStateProperty.all(const IconThemeData(
          color: Color(0xFF050505),
        )),
        labelTextStyle: MaterialStateProperty.all(const TextStyle(
            color: Color(0xFF050505), fontWeight: FontWeight.w500))),
    bottomSheetTheme:
    const BottomSheetThemeData(modalBackgroundColor: Color(0xFFE8E8EF)));

//ESCURO
ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColorBrightness: Brightness.light,
    primaryColor: const Color(0xFF202124),
    scaffoldBackgroundColor: const Color(0xFF202124),
    colorScheme: const ColorScheme.dark(
        background: Color(0xFF202124),
        primary: Color(0xFF7592CC),
        secondary: Color(0xFF7592CC),
        secondaryVariant: Color(0xFF8BB6FF)),
    appBarTheme: const AppBarTheme(
        color: Color(0xFF202124),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFFF5F5F5)),
        titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFFFFFFFF))),
    cardTheme: const CardTheme(
      color: Color(0xFF25282E),
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Color(0xFF292828),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF16171A),
    ),
    bottomAppBarColor: const Color(0xFF16171A),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: const Color(0xFF16171A),
        indicatorColor: const Color(0xFF7592CC),
        iconTheme: MaterialStateProperty.all(const IconThemeData(
          color: Color(0xFFEAEAEA),
        )),
        labelTextStyle: MaterialStateProperty.all(const TextStyle(
            color: Color(0xFFEAEAEA), fontWeight: FontWeight.w500))),
    bottomSheetTheme:
    const BottomSheetThemeData(modalBackgroundColor: Color(0xFF202124)));

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
