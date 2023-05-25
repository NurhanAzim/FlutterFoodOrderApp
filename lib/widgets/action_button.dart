import 'package:flutter/material.dart';

Widget actionButton(
  Color backgroundColor,
  Color foregroundColor,
  VoidCallback onPressed,
  String text,
) {
  return TextButton(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(backgroundColor),
      foregroundColor: MaterialStateProperty.all(foregroundColor),
      shape: MaterialStateProperty.all(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
      ),
      minimumSize: MaterialStateProperty.all(const Size(200, 50)),
    ),
    onPressed: onPressed,
    child: Text(text),
  );
}
