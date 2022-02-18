import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color cardColor;
  final Widget cardContent;
  final Function() whenPressed;

  ReusableCard(
      {required this.cardColor,
      required this.cardContent,
      required this.whenPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: whenPressed,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardContent,
      ),
    );
  }
}
