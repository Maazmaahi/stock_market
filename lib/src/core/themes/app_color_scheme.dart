part of '../core.dart';

class AppColorScheme {
  static final lightColorScheme = const ColorScheme.light(
    brightness: Brightness.light,
    primary: AppColors.lightPrimaryColor,
    secondary: AppColors.lightSecondaryColor,
    inversePrimary: AppColors.darkPrimaryColor,
  ).copyWith(
    surface: AppColors.white,
    onSurface: AppColors.black,
    shadow: AppColors.shadowColor,
    inverseSurface: AppColors.darkSearchBox,
  );

  static final darkColorScheme = const ColorScheme.dark(
    brightness: Brightness.dark,
    primary: AppColors.darkPrimaryColor,
    secondary: AppColors.darkSecondaryColor,
    inversePrimary: AppColors.lightPrimaryColor,
  ).copyWith(
    surface: AppColors.black,
    onSurface: AppColors.white,
    shadow: AppColors.shadowColor,
    inverseSurface: AppColors.lightSearchBox,
  );
}
