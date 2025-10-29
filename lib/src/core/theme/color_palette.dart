import 'package:flutter/material.dart';

/// DarkMode Colors
abstract final class ColorPalette {
  // === Brand / Petrol ===
  static const Color petrol0 = Color(0xFF232935); // Tiefes Dunkel (App-Surface)
  static const Color petrol1 = Color(0xFF2C4851); // Primary (dezent)
  static const Color petrol2 = Color(0xFF307080); // Kräftiger Button-Ton

  // === Burgundy ===
  static const Color burgundy1 = Color(0xFF5E273A); // Secondary (dezent)
  static const Color burgundy2 = Color(0xFF742552); // Home/Back Buttons

  // === Textcolors ===
  static const Color text0 = Color(0xFFD8DFEE); // Text auf Surface
  static const Color text1 = Color(0xFFCFE2E6); // Text auf Petrol
  static const Color text2 = Color(0xFFEFD9E1); // Text auf Burgundy

  // === Others ===
  static const Color whiteTransparent = Color(0x4DFFFFFF);
  static const Color blackTransparent = Color(0x4D000000);
  static const Color red1 = Color(0xFFE74C3C); // Error

  // not-const Helper
  static final Color outlineSoft = text0.withValues(alpha: 0.60);
  static final Color outlineSofter = text0.withValues(alpha: 0.38);

  // petrol2 with alpha: 0.6
  static const Color cardDefaultBackground = Color(0x99307080);

  // white with alpha: 0.15
  static const Color cardDefaultBorder = Color(0x26FFFFFF);
}
