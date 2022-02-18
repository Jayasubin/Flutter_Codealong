import 'package:flutter/material.dart';

class FlashButton extends StatelessWidget {
  final Color buttonColor;
  final String buttonTitle;
  final Function action;

  const FlashButton(
      {required this.buttonColor,
      required this.buttonTitle,
      required this.action});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: buttonColor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            action();
            //Navigator.pushNamed(context, LoginScreen.screenID);
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            buttonTitle,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
