import 'package:flutter/material.dart';

class CustomTheme {
  static final dayTheme = ThemeData.light().copyWith(
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        splashFactory: InkRipple.splashFactory,
      ),
    )
  );
  static final nightTheme = ThemeData.dark();
}
