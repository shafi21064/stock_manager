import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class AppFloatingActionButtonTheme {
  AppFloatingActionButtonTheme._(); // Prevent instance creation

  static FloatingActionButtonThemeData lightFloatingActionButtonTheme = FloatingActionButtonThemeData(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.white,
    elevation: 6,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
    sizeConstraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
  );

  static FloatingActionButtonThemeData darkFloatingActionButtonTheme = FloatingActionButtonThemeData(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.black,
    elevation: 6,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
    sizeConstraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
  );
}
