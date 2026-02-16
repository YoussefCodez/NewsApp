import 'package:flutter/material.dart';
import 'package:news/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    scaffoldBackgroundColor: AppColors.secondaryColor,
    colorScheme: ColorScheme.light(
      primary: AppColors.secondaryColor,
      secondary: AppColors.primaryColor,
      secondaryContainer: AppColors.grayLight,
    ),
  );
  static ThemeData get darkTheme => ThemeData(
    scaffoldBackgroundColor: AppColors.primaryColor,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      secondaryContainer: AppColors.grayDark,
    ),
  );
}