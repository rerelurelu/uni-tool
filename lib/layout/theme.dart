import 'package:flutter/material.dart';

import 'package:uni_tool/layout/color.dart';

/* Theme Color */
final ThemeData defaultTheme = ThemeData().copyWith(
  //scaffoldBackgroundColor: Colors.orangeAccent,
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: emerald,
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
      ),
    ),
    hintStyle: TextStyle(
      color: teal,
    ),
  ),
);

/* Background Color */
final BoxDecoration defaultColor = BoxDecoration().copyWith(
  gradient: LinearGradient(
    colors: [
      lightFog,
      fog,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.bottomRight,
  ),
);
