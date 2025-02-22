part of '../core.dart';

class AppTextTheme {
  static const lightTextTheme = TextTheme(
    displayLarge: TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.black),
    displayMedium: TextStyle(
        fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.black),
    displaySmall: TextStyle(fontSize: 20, color: AppColors.black),
    bodyLarge: TextStyle(fontSize: 16, color: AppColors.lightTextColor),
    bodyMedium: TextStyle(fontSize: 14, color: AppColors.lightTextColor),
    bodySmall: TextStyle(fontSize: 13, color: AppColors.lightTextColor),
    labelLarge: TextStyle(fontSize: 15, color: AppColors.lightTextColor),
    labelSmall: TextStyle(fontSize: 11, color: AppColors.lightTextColor),
  );

  static const darkTextTheme = TextTheme(
    displayLarge: TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.white),
    displayMedium: TextStyle(
        fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.white),
    displaySmall: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.white),
    bodyLarge: TextStyle(fontSize: 16, color: AppColors.darkTextColor),
    bodyMedium: TextStyle(fontSize: 14, color: AppColors.darkTextColor),
    bodySmall: TextStyle(fontSize: 13, color: AppColors.darkTextColor),
    labelLarge: TextStyle(fontSize: 15, color: AppColors.darkTextColor),
    labelSmall: TextStyle(fontSize: 11, color: AppColors.darkTextColor),
  );
}
