import 'package:flutter/material.dart';

Color primary = const Color.fromARGB(255, 213, 7, 19);

class Styles {
  static Color primaryColor = primary;
  static Color textColor = Colors.grey.shade500;
  static Color bgColor = const Color.fromARGB(255, 243, 242, 243);
  static Color redColor = const Color(0xFFFA4A0C);
  static TextStyle textStyle = TextStyle(
      fontSize: 12,
      color: textColor,
      fontWeight: FontWeight.normal,
      fontFamily: 'SFProRounded');
  static TextStyle headlineStyle1 = const TextStyle(
      fontSize: 34,
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontFamily: 'SFProRounded');
  static TextStyle headlineStyle2 = const TextStyle(
      fontSize: 22,
      color: Colors.black,
      fontWeight: FontWeight.w800,
      letterSpacing: 0,
      fontFamily: 'SFProRounded');
  static TextStyle headlineStyle3 = TextStyle(
      fontSize: 17,
      color: redColor,
      fontWeight: FontWeight.w600,
      fontFamily: 'SFProRounded');
}
