import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    required this.action,
    required this.icon,
    required this.label,
  }) : super(key: key);

  final String label;
  final Function action;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        padding:
            MaterialStateProperty.all(const EdgeInsets.fromLTRB(20, 5, 20, 5)),
        shape: MaterialStateProperty.all(const StadiumBorder()),
        backgroundColor: MaterialStateProperty.all(
          Colors.purple.shade300,
        ),
      ),
      onPressed: () {
        action();
      },
      label: Text(
        label,
        style: const TextStyle(fontSize: 18),
      ),
      icon: icon,
    );
  }
}
