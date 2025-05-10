import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class AppSnackBarTheme {
  AppSnackBarTheme._(); // Prevent instance creation

  static SnackBarThemeData lightSnackBarTheme = SnackBarThemeData(
    backgroundColor: AppColors.primary,
    contentTextStyle: const TextStyle(
      color: AppColors.white,
      fontSize: 16.0,
    ),
    actionTextColor: AppColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    elevation: 4.0,
  );

  static SnackBarThemeData darkSnackBarTheme = SnackBarThemeData(
    backgroundColor: AppColors.primary,
    contentTextStyle: const TextStyle(
      color: AppColors.black,
      fontSize: 16.0,
    ),
    actionTextColor: AppColors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    elevation: 4.0,
  );
}
