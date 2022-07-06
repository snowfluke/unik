import 'package:flutter/material.dart';

class ScreenContainer extends StatelessWidget {
  final String title;
  final Widget child;
  const ScreenContainer({Key? key, required this.title, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: child,
      )),
    );
  }
}
