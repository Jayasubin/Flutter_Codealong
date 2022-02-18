import 'package:flutter/material.dart';

const kLineColor = Colors.black87;
const kMainColor = Colors.amber;
const kAccentColor = Color(0xFFFFD452);
const kDarkenedAccent = Color(0xFF756126);

const kPendingTaskStyle =
    TextStyle(color: kLineColor, fontSize: 20, fontWeight: FontWeight.w700);

const kCompletedTaskStyle = TextStyle(
    color: kLineColor,
    fontSize: 20,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.lineThrough);

ButtonStyle kButtonStyle = ButtonStyle(
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
    const EdgeInsets.symmetric(
      vertical: 12.0,
    ),
  ),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        20.0,
      ),
    ),
  ),
  backgroundColor: MaterialStateProperty.all<Color>(kMainColor),
  foregroundColor: MaterialStateProperty.all<Color>(kLineColor),
);
