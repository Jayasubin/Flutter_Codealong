import 'package:flutter/material.dart';
import './my_constants.dart';
import 'my_constants.dart';

class ReusableContent extends StatelessWidget {
  IconData iconName;
  String label = '';

  ReusableContent(this.iconName, this.label, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconName,
          size: 70,
          color: Colors.white,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
