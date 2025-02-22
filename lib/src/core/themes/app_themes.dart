part of '../core.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.lightPrimaryColor,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: AppColorScheme.lightColorScheme,
    textTheme: AppTextTheme.lightTextTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.darkPrimaryColor,
    scaffoldBackgroundColor: AppColors.black,
    colorScheme: AppColorScheme.darkColorScheme,
    textTheme: AppTextTheme.darkTextTheme,
  );
}
