import 'package:flutter/material.dart';
import 'package:unik/screens.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: appScreens[_pageIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Colors.purple.shade300,
            labelTextStyle: MaterialStateProperty.all(
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
        child: NavigationBar(
            height: 70,
            backgroundColor: Colors.grey.shade200,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            selectedIndex: _pageIndex,
            animationDuration: const Duration(milliseconds: 700),
            onDestinationSelected: (idx) => setState(() => {_pageIndex = idx}),
            destinations: const [
              NavigationDestination(
                  selectedIcon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  icon: Icon(Icons.home_outlined),
                  label: "Beranda"),
              NavigationDestination(
                  selectedIcon: Icon(
                    Icons.save,
                    color: Colors.white,
                  ),
                  icon: Icon(Icons.save_outlined),
                  label: "Tersimpan"),
              NavigationDestination(
                  selectedIcon: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  icon: Icon(Icons.settings_outlined),
                  label: "Pengaturan"),
            ]),
      ),
    );
  }
}
