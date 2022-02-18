import 'package:flutter/material.dart';
import 'my_constants.dart';
import 'custom_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomCardContent extends StatelessWidget {
  final String cardTitle;
  final int value;
  final String suffix;
  final Function() whenMinusPressed;
  final Function() whenPlusPressed;

  BottomCardContent(
      {required this.cardTitle,
      required this.value,
      required this.suffix,
      required this.whenMinusPressed,
      required this.whenPlusPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(cardTitle, style: kLabelTextStyle),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(value.toString(), style: kInfoStyle),
                  Text(suffix, style: kLabelTextStyle),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoundCustomButton(
                icon: FontAwesomeIcons.minus,
                whenPressed: whenMinusPressed,
              ),
              RoundCustomButton(
                icon: FontAwesomeIcons.plus,
                whenPressed: whenPlusPressed,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
