import 'package:flutter/material.dart';
import 'package:presentation/theme/app_colors.dart';

class AppTheme {
  static final lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.white,
    secondary: AppColors.grey,
    onSecondary: AppColors.white,
    error: AppColors.red,
    onError: AppColors.white,
    background: AppColors.white,
    onBackground: AppColors.grey,
    surface: AppColors.grey,
    onSurface: AppColors.white,
  );

  static final darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primary,
    onPrimary: AppColors.grey,
    secondary: AppColors.black,
    onSecondary: AppColors.grey,
    error: AppColors.red,
    onError: AppColors.grey,
    background: AppColors.background,
    onBackground: AppColors.grey,
    surface: AppColors.black,
    onSurface: AppColors.black,
  );
}
