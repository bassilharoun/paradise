import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = const Color(
      0xff42178d); // static to can access it without taking an instance
  static Color darkPrimary = const Color(0xff181642);
  static Color mediumPrimary = const Color(0xff118373);
  static Color lightPrimary = const Color(0xffabe3dc);
  static Color reverseColor = const Color(0xfff0a0a5);
  static Color background = Colors.white;

  static Color grey1 = const Color(0xff707070);
  static Color grey2 = const Color(0xff797979);
  static Color white = const Color(0xffffffff);
  static Color error = const Color(0xffe61f34);
}
