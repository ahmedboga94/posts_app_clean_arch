import 'package:flutter/material.dart';
import 'package:posts_app_clean/core/app_colors.dart';

class AppTextStyles {
  static TextTheme lightTextTheme = const TextTheme(
    displayLarge: TextStyle(color: AppColors.darkColor, fontSize: 112),
    displayMedium: TextStyle(color: AppColors.darkColor, fontSize: 56),
    displaySmall: TextStyle(color: AppColors.darkColor, fontSize: 45),
    headlineMedium: TextStyle(color: AppColors.darkColor, fontSize: 34),
    headlineSmall: TextStyle(color: AppColors.darkColor, fontSize: 24),
    titleLarge: TextStyle(color: AppColors.darkColor, fontSize: 22),
    titleMedium: TextStyle(color: AppColors.darkColor, fontSize: 16),
    titleSmall: TextStyle(color: AppColors.darkColor, fontSize: 14),
    bodyLarge: TextStyle(color: AppColors.darkColor, fontSize: 18),
    bodyMedium: TextStyle(color: AppColors.darkColor, fontSize: 14),
    labelSmall: TextStyle(color: AppColors.darkColor, fontSize: 10),
    bodySmall: TextStyle(color: AppColors.darkColor, fontSize: 12),
  );

  static TextTheme darkTextTheme = const TextTheme(
    displayLarge: TextStyle(color: AppColors.lightGreyColor, fontSize: 112),
    displayMedium: TextStyle(color: AppColors.lightGreyColor, fontSize: 56),
    displaySmall: TextStyle(color: AppColors.lightGreyColor, fontSize: 45),
    headlineMedium: TextStyle(color: AppColors.lightGreyColor, fontSize: 34),
    headlineSmall: TextStyle(color: AppColors.lightGreyColor, fontSize: 24),
    titleLarge: TextStyle(color: AppColors.lightGreyColor, fontSize: 22),
    titleMedium: TextStyle(color: AppColors.lightGreyColor, fontSize: 16),
    titleSmall: TextStyle(color: AppColors.lightGreyColor, fontSize: 14),
    bodyLarge: TextStyle(color: AppColors.lightGreyColor, fontSize: 18),
    bodyMedium: TextStyle(color: AppColors.lightGreyColor, fontSize: 14),
    labelSmall: TextStyle(color: AppColors.lightGreyColor, fontSize: 10),
    bodySmall: TextStyle(color: AppColors.lightGreyColor, fontSize: 12),
  );
}
