import 'package:bd_app_v0/src/app/theme/app_colors.dart';
import 'package:bd_app_v0/src/app/theme/text_styles.dart';
import 'package:flutter/material.dart';

abstract final class AppTheme {
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: AppColors.darkColorScheme,
    textTheme: TextStyles.textTheme,
    scaffoldBackgroundColor: AppColors.darkColorScheme.surface,
  );
}
