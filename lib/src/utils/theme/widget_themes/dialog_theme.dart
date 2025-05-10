import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class AppDialogTheme {
  AppDialogTheme._(); // Prevent instance creation

  static DialogTheme lightDialogTheme = DialogTheme(
    backgroundColor: AppColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    titleTextStyle: const TextStyle(
      color: AppColors.dark,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    contentTextStyle: const TextStyle(
      color: AppColors.dark,
      fontSize: 16.0,
    ),
  );

  static DialogTheme darkDialogTheme = DialogTheme(
    backgroundColor: AppColors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    titleTextStyle: const TextStyle(
      color: AppColors.light,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    contentTextStyle: const TextStyle(
      color: AppColors.light,
      fontSize: 16.0,
    ),
  );
}
