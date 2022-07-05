import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Alert {
  void notify(msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 15);
  }
}
