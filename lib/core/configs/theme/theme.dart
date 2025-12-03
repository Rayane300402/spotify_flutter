import 'package:flutter/material.dart';
import 'package:spotify_futter/core/configs/theme/palette.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Palette.primary,
    scaffoldBackgroundColor: Palette.surfaceLight,
    brightness: Brightness.light,
    fontFamily: 'Satoshi',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Palette.primary,
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Palette.primary,
    scaffoldBackgroundColor: Palette.surfaceDark,
    brightness: Brightness.dark,
    fontFamily: 'Satoshi',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Palette.primary,
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
  );
}

