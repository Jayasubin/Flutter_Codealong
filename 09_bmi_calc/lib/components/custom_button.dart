import 'package:flutter/material.dart';
import 'my_constants.dart';

class RoundCustomButton extends StatelessWidget {
  final IconData icon;
  final Function() whenPressed;

  RoundCustomButton({required this.icon, required this.whenPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: kButtonColor,
      splashColor: kButtonSplashColor,
      elevation: 0.0,
      constraints: const BoxConstraints.tightFor(
        width: 65.0,
        height: 65.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Icon(icon),
      onPressed: whenPressed,
    );
  }
}
