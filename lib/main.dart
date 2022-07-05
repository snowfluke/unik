import 'package:flutter/material.dart';
import 'package:unik/main_screen.dart';
import 'package:unik/themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (BuildContext context, child) {
          final themeProvider =
              Provider.of<ThemeProvider>(context, listen: false);

          return MaterialApp(
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            home: const MainScreen(),
            title: 'unik',
          );
        });
  }
}
