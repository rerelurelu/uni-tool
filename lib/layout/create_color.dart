import 'package:flutter/material.dart';

MaterialColor createColor(int hex) {
  final newColor = MaterialColor(
    hex,
    createColorPalette(hex),
  );

  return newColor;
}

Map<int, Color> createColorPalette(int hex) {
  final color = {
    50: Color(hex).withOpacity(.1),
    100: Color(hex).withOpacity(.2),
    200: Color(hex).withOpacity(.3),
    300: Color(hex).withOpacity(.4),
    400: Color(hex).withOpacity(.5),
    500: Color(hex).withOpacity(.6),
    600: Color(hex).withOpacity(.7),
    700: Color(hex).withOpacity(.8),
    800: Color(hex).withOpacity(.9),
    900: Color(hex).withOpacity(1),
  };

  return color;
}
