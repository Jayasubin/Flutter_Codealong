import 'package:flutter/material.dart';

import 'my_constants.dart';

class BottomButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  BottomButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: kBackgroundColor,
      child: Container(
        height: kBottomBarHeight,
        margin: const EdgeInsets.fromLTRB(15, 10, 15, 15),
        child: ElevatedButton(
          child: Text(
            label,
            style: kButtonTextStyle,
          ),
          onPressed: onTap,
        ),
      ),
    );
  }
}
