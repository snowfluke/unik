import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unik/shared/shared.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  List<String>? nikList;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      nikList = prefs.getStringList("shared_nik_list");
    });
  }

  renderNikList() {
    if (nikList != null) {
      return Column(
        children: nikList!.map((el) {
          return Text(el);
        }).toList(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      title: "Tersimpan",
      child: Column(
        children: [
          const Header(
            title: "Daftar NIK Tersimpan",
            description: "Mempermudah NIK tanpa perlu mengingat-ingat kembali",
          ),
          Body(
            child: renderNikList(),
          )
        ],
      ),
    );
  }
}
