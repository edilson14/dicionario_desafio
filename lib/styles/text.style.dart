import 'package:flutter/material.dart';

class AppStyles {
  AppStyles._();

  static ButtonStyle buttonStyle = ButtonStyle(
    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
        side: const BorderSide(
          color: Colors.black,
        ),
      ),
    ),
  );

  static TextStyle textStyleButton = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
}
