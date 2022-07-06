import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

final primaryColor = Colors.purple.shade300;
final secondaryColor = Colors.purple.shade200;
final thirdColor = Colors.purple.shade100;
final backgroundColor = Colors.grey.shade200;
final backgroundColorDark = Colors.grey.shade900;
const white = Colors.white;
const black = Colors.black;

class MyThemes {
  static final lightTheme = ThemeData(
      appBarTheme: AppBarTheme(backgroundColor: primaryColor),
      scaffoldBackgroundColor: backgroundColor,
      textTheme: TextTheme(
          headline4: TextStyle(
        color: backgroundColorDark,
      )),
      fontFamily: GoogleFonts.nunito().fontFamily,
      colorScheme: const ColorScheme.light());

  static final darkTheme = ThemeData(
      appBarTheme: AppBarTheme(backgroundColor: primaryColor),
      scaffoldBackgroundColor: backgroundColorDark,
      textTheme: TextTheme(
          headline4: TextStyle(
        color: backgroundColor,
      )),
      fontFamily: GoogleFonts.nunito().fontFamily,
      colorScheme: const ColorScheme.dark());
}

class ThemeProvider extends ChangeNotifier {
  String currentTheme = "system";

  ThemeMode get themeMode {
    if (currentTheme == "light") {
      return ThemeMode.light;
    }

    if (currentTheme == "dark") {
      return ThemeMode.dark;
    }

    return ThemeMode.system;
  }

  changeTheme(String theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("savedTheme", theme);

    currentTheme = theme;
    notifyListeners();
  }

  initialize() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    currentTheme = prefs.getString("savedTheme") ?? "system";
    notifyListeners();
  }
}
