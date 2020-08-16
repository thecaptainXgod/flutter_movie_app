import 'package:flutter/material.dart';

class KColors {
  KColors._();

  static Color getColor() {
    colors.shuffle();

    return colors[0];
  }

  static List<Color> colors = [
    Color(0xffe87ea1),
    Color(0xffe86252),
    Color(0xff12355b),
    Color(0xff4c6085),
    Color(0xff32322c),
    Color(0xffDEAAFF),
    Color(0xff5e548e),
    Color(0xff463f3a),
    Color(0xff6d2e46),
    Color(0xffff8c61),
    Color(0xff16697a),
    Color(0xff4ce0b3),
    Color(0xff485696),
  ];
}
