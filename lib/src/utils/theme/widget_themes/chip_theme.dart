import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class AppChipTheme {
  AppChipTheme._();

  static final ChipThemeData lightChipTheme = ChipThemeData(
    backgroundColor: AppColors.lightGrey,
    disabledColor: AppColors.grey.withAlpha(102),
    selectedColor: AppColors.primary,
    secondarySelectedColor: AppColors.primary,
    labelStyle: const TextStyle(color: AppColors.black),
    secondaryLabelStyle: const TextStyle(color: AppColors.white),
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: const BorderSide(color: AppColors.grey),
    ),
    checkmarkColor: AppColors.white,
    brightness: Brightness.light,
  );

  static final ChipThemeData darkChipTheme = ChipThemeData(
    backgroundColor: AppColors.darkGrey,
    disabledColor: AppColors.darkerGrey,
    selectedColor: AppColors.primary,
    secondarySelectedColor: AppColors.primary,
    labelStyle: const TextStyle(color: AppColors.white),
    secondaryLabelStyle: const TextStyle(color: AppColors.white),
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: const BorderSide(color: AppColors.darkerGrey),
    ),
    checkmarkColor: AppColors.white,
    brightness: Brightness.dark,
  );
}
