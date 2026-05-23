import 'package:flutter/material.dart';
import 'package:my_likndin_website/core/resources/colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(iconColor: AppColors.primaryColor),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(iconColor: Colors.white),
    ),
  );
}
