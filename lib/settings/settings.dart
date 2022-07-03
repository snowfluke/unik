import 'package:flutter/material.dart';
import 'package:unik/shared/shared.dart';
import 'package:toggle_switch/toggle_switch.dart';

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
                    "Tema gelap",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                ToggleSwitch(
                  minWidth: 50.0,
                  cornerRadius: 20.0,
                  activeBgColors: [
                    [Colors.purple[300]!],
                    [Colors.purple[300]!]
                  ],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey[200]!,
                  inactiveFgColor: Colors.white,
                  initialLabelIndex: 1,
                  totalSwitches: 2,
                  labels: const ['ON', 'OFF'],
                  radiusStyle: true,
                  onToggle: (index) {},
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
