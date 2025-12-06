import 'package:flutter/material.dart';
import 'package:spotify_futter/core/configs/theme/palette.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Palette.primary,
    scaffoldBackgroundColor: Palette.surfaceLight,
    brightness: Brightness.light,
    fontFamily: 'Satoshi',
    sliderTheme: SliderThemeData(
        overlayShape: SliderComponentShape.noOverlay
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 22, // tuned for ~80 total height with single line
      ),
      hintStyle: const TextStyle(
        color: Color(0xff383838),
        fontWeight: FontWeight.w500,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: Colors.white,
          width:1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: Palette.textDark,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Palette.primary,
          width: 1,
        ),
      ),
    ),
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
    sliderTheme: SliderThemeData(
        overlayShape: SliderComponentShape.noOverlay,
        activeTrackColor: Color(0xffB7B7B7),
        inactiveTrackColor: Colors.grey.withOpacity(0.3),
        thumbColor: Color(0xffB7B7B7)

    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 30,
      ),
      hintStyle: const TextStyle(
        color: Color(0xffA7A7A7),
        fontWeight: FontWeight.w500,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 1,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(
          color: Palette.primary,
          width: 1,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Palette.primary,
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
  );
}

