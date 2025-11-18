import 'package:bd_app_v0/src/app/theme/color_palette.dart';
import 'package:flutter/material.dart';

abstract final class AppColors {
  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: ColorPalette.petrol2,
    onPrimary: ColorPalette.text1,
    secondary: ColorPalette.burgundy2,
    onSecondary: ColorPalette.text2,
    tertiary: ColorPalette.petrol1,
    onTertiary: ColorPalette.text1,
    surface: ColorPalette.petrol0,
    surfaceContainerHigh: ColorPalette.petrol1,
    onSurface: ColorPalette.text0,
    error: ColorPalette.red1,
    onError: ColorPalette.text0,
  );
}
