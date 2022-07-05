import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var appTheme = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: Colors.purple.shade300),
    fontFamily: GoogleFonts.nunito().fontFamily,
    brightness: Brightness.light,
    textTheme: const TextTheme(
      button: TextStyle(
        fontSize: 20,
      ),
    ));

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDark => themeMode == ThemeMode.dark;
  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final lightTheme = ThemeData(
      appBarTheme: AppBarTheme(backgroundColor: Colors.purple.shade300),
      scaffoldBackgroundColor: Colors.grey.shade200,
      fontFamily: GoogleFonts.nunito().fontFamily,
      colorScheme: ColorScheme.light());
  static final darkTheme = ThemeData(
      appBarTheme: AppBarTheme(backgroundColor: Colors.purple.shade300),
      scaffoldBackgroundColor: Colors.grey.shade900,
      fontFamily: GoogleFonts.nunito().fontFamily,
      colorScheme: ColorScheme.dark());
}
