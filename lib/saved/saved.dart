import 'package:nik_parser_id/nik_parser_id.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unik/parse/parse.dart';
import 'package:unik/shared/shared.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  List<String>? nikList;
  final alert = Alert();

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
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(const StadiumBorder()),
                    backgroundColor: MaterialStateProperty.all(
                      Colors.purple.shade100,
                    ),
                  ),
                  onPressed: () {
                    NIK data = NIK(nik: el);
                    data.parseNik();
                    List mappedResult = NIKParser.mapResult(data);

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ParseScreen(data: mappedResult, nik: el)));
                  },
                  child: Text(
                    textAlign: TextAlign.center,
                    el,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(const StadiumBorder()),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.purple.shade300,
                  ),
                ),
                onPressed: () async {
                  try {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    List<String> listBefore =
                        prefs.getStringList("shared_nik_list") ?? [];
                    listBefore.removeWhere((er) => er == el);

                    prefs.setStringList("shared_nik_list", listBefore);
                    alert.notify("Terhapus");
                    setState(() {
                      getData();
                    });

                    return;
                  } catch (e) {
                    alert.notify("Terjadi kesalahan");
                  }
                },
                child: const Icon(
                  Icons.delete,
                  size: 25,
                ),
              )
            ],
          );
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
