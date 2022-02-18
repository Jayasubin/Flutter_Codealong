import 'package:flutter/material.dart';
import 'constants.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function onClick;

  const MyButton({Key? key, required this.label, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          onClick();
        },
        style: kButtonStyle,
        child: Text(
          label,
          style: const TextStyle(
            color: kLineColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
