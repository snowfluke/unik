import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unik/shared/shared.dart';
import 'package:unik/themes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      title: "Pengaturan",
      child: Column(
        children: [
          const Header(
            title: "Atur Kenyamananmu",
            description:
                "Sesuaikan tema dan bagaimana aplikasi harus bertindak",
          ),
          Body(
            child: Container(
              alignment: Alignment.topCenter,
              width: MediaQuery.of(context).size.width,
              child: Row(children: [
                const Expanded(
                  child: Text(
                    "Tema gelap (under devs)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Consumer<ThemeProvider>(builder: (context, provider, child) {
                  return Switch(
                      value: provider.currentTheme == "light" ? false : true,
                      activeColor: Colors.purple.shade300,
                      onChanged: (el) {
                        String themeValue = el ? "dark" : "light";
                        provider.changeTheme(themeValue);
                      });
                }),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
