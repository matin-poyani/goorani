import 'package:flutter/cupertino.dart';

class ColorStyle {
  final Color colorDark;
  final Color colorYellow;
  final Color colorSilverGray;
  final Color colorGray;
  final Color colorBlack;
  final Color colorWhite;

  const ColorStyle({
    this.colorDark = const Color.fromRGBO(14, 11, 31, 10),
    this.colorYellow = const Color.fromRGBO(203, 251, 94, 10),
    this.colorSilverGray = const Color.fromRGBO(238, 238, 238, 100),
    this.colorGray = const Color.fromRGBO(113, 155, 123, 10),
    this.colorBlack = const Color.fromRGBO(32, 36, 47, 10),
    this.colorWhite = const Color.fromRGBO(255, 255, 255, 10),
  });
}
