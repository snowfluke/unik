import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nik_parser_id/nik_parser_id.dart';
import 'package:unik/parse/parse.dart';
import 'package:unik/shared/shared.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String textValue = "";

  String caps(str) => str
      .toLowerCase()
      .split(" ")
      .map((str) => str[0].toUpperCase() + str.substring(1))
      .join(" ");

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      title: "uNIK - Pengurai NIK",
      child: Column(
        children: [
          const Header(
            title: "Masukkan NIK KTP",
            description:
                "Periksa informasi apa saja yang terdapat di dalam NIK-mu!",
          ),
          Body(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                children: [
                  SizedBox(
                    child: Icon(
                      Icons.person_search,
                      size: 100,
                      color: Colors.purple.shade300,
                    ),
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      setState(() {
                        textValue = value;
                      });
                    },
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple.shade300),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.purple.shade300,
                        width: 2,
                      )),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.purple.shade300,
                        width: 2,
                      )),
                      hintText: "Contoh: 3201230101970005",
                      hintStyle: TextStyle(
                          color: Colors.grey.shade300,
                          fontWeight: FontWeight.normal),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(16)
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ActionButton(
                    label: "Uraikan",
                    icon: const Icon(Icons.search),
                    action: () {
                      if (textValue.length != 16) {
                        Fluttertoast.showToast(
                            msg: "Panjang NIK harus 16 karakter!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 15);
                        return;
                      }

                      FocusScopeNode currentFocus = FocusScope.of(context);

                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }

                      NIK data = NIK(nik: textValue);
                      data.parseNik();
                      bool status = data.getData("status");

                      if (!status) {
                        String msg = data.getData("msg");

                        Fluttertoast.showToast(
                            msg: msg,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 15);
                        return;
                      }

                      List mappedResult = [
                        data.getData("kelamin"),
                        data.getData("lahir")["string"],
                        caps(data.getData("provinsi")),
                        caps(data.getData("kotakab")),
                        caps(data.getData("kecamatan")),
                        data.getData("tambahan")["kodepos"],
                        data.getData("uniqcode"),
                      ];

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ParseScreen(data: mappedResult, nik: textValue)));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
