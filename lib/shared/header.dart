import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final String description;
  final Widget? button;

  const Header(
      {Key? key, required this.title, this.description = "", this.button})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              color: Color(0xcc000000),
              fontWeight: FontWeight.bold,
            ),
          ),
          button != null
              ? Container(child: button)
              : Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xcc000000),
                  ),
                ),
        ],
      ),
    );
  }
}
