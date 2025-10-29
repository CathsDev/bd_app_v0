import 'package:bd_app_v0/src/core/theme/color_palette.dart';
import 'package:flutter/material.dart';

abstract final class TextStyles {
  static const textTheme = TextTheme(
    // Headlines
    headlineLarge: TextStyle(
      color: ColorPalette.text0,
      fontSize: 32.0,
      fontWeight: FontWeight.w400,
      height: 1.25,
    ),
    headlineMedium: TextStyle(
      color: ColorPalette.text0,
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      height: 1.25,
    ),
    headlineSmall: TextStyle(
      color: ColorPalette.text0,
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      height: 1.25,
    ),
    // Body
    bodyLarge: TextStyle(
      color: ColorPalette.text0,
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      height: 1.45,
    ),
    bodyMedium: TextStyle(
      color: ColorPalette.text0,
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      height: 1.45,
    ),
    bodySmall: TextStyle(
      color: ColorPalette.text0,
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      height: 1.40,
    ),
    // Labels / Buttons
    labelLarge: TextStyle(
      color: ColorPalette.text0,
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      height: 1.20,
      letterSpacing: 0.1,
    ),
    labelMedium: TextStyle(
      color: ColorPalette.text0,
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      height: 1.20,
      letterSpacing: 0.1,
    ),
    labelSmall: TextStyle(
      color: ColorPalette.text0,
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
      height: 1.15,
      letterSpacing: 0.1,
    ),
  );
}
