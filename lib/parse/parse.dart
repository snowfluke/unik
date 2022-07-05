import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unik/shared/shared.dart';

class ParseScreen extends StatefulWidget {
  const ParseScreen({Key? key, required this.data, required this.nik})
      : super(key: key);
  final List data;
  final String nik;

  @override
  State<ParseScreen> createState() => _ParseScreenState();
}

class _ParseScreenState extends State<ParseScreen> {
  final alert = Alert();

  getList(id, key) {
    const dataRemap = [
      {
        "icon": Icons.account_circle,
        "identifier": 'Jenis Kelamin: ',
      },
      {
        "icon": Icons.calendar_today,
        "identifier": 'Tanggal Lahir: ',
      },
      {
        "icon": Icons.map,
        "identifier": 'Provinsi: ',
      },
      {
        "icon": Icons.place,
        "identifier": 'Kab/Kota: ',
      },
      {
        "icon": Icons.home,
        "identifier": 'Kecamatan: ',
      },
      {
        "icon": Icons.code,
        "identifier": 'Kode Pos: ',
      },
      {"icon": Icons.qr_code, "identifier": 'Urutan: '}
    ];

    return dataRemap[id][key];
  }

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      title: "Hasil",
      child: Column(children: [
        Header(
          title: widget.nik,
          button: ActionButton(
              action: () async {
                try {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  List<String> listBefore =
                      prefs.getStringList("shared_nik_list") ?? [];
                  listBefore.add(widget.nik);

                  prefs.setStringList("shared_nik_list", listBefore);
                  alert.notify("Tersimpan");

                  return;
                } catch (e) {
                  alert.notify("Terjadi kesalahan");
                }
              },
              icon: const Icon(Icons.save_alt),
              label: "Simpan"),
        ),
        Body(
          child: Column(children: [
            const SizedBox(
              child: Icon(
                Icons.timeline,
                size: 50,
              ),
            ),
            Flexible(
              flex: 1,
              child: ListView.builder(
                itemCount: widget.data.length,
                itemBuilder: ((context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: index % 2 == 0
                            ? Colors.white
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15)),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            child: Icon(
                              getList(index, "icon"),
                              size: 30,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            getList(index, "identifier"),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text(
                            widget.data[index],
                            style: const TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            )
          ]),
        )
      ]),
    );
  }
}
