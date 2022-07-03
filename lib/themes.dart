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
