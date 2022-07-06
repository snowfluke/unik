import 'package:flutter/material.dart';
import 'package:unik/main_screen.dart';
import 'package:unik/themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<ThemeProvider>(
    create: (_) => ThemeProvider()..initialize(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, provider, child) {
      return MaterialApp(
        home: const MainScreen(),
        title: 'unik',
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        themeMode: provider.themeMode,
      );
    });
  }
}
