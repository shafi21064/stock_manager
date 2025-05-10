import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';


class AppDropdownThemes {
  // Light theme
  static DropdownMenuThemeData lightDropdownTheme = DropdownMenuThemeData(
    textStyle: const TextStyle(
      color: AppColors.textPrimary,
      fontSize: AppSizes.fontMd,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
        vertical: AppSizes.sm,
        horizontal: AppSizes.md,
      ),
      hintStyle: const TextStyle(
        color: AppColors.textSecondary,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.cardRadiusSm),
        borderSide: const BorderSide(color: AppColors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.cardRadiusSm),
        borderSide: const BorderSide(color: AppColors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.cardRadiusSm),
        borderSide: const BorderSide(color: AppColors.darkGrey),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.cardRadiusSm),
        borderSide: const BorderSide(color: AppColors.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.cardRadiusSm),
        borderSide: const BorderSide(color: AppColors.error),
      ),
    ),
    menuStyle: MenuStyle(
      backgroundColor: const WidgetStatePropertyAll(AppColors.white),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(vertical: AppSizes.xs),
      ),
      elevation: const WidgetStatePropertyAll(AppSizes.cardElevation),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.cardRadiusSm),
        ),
      ),
    ),
  );

  // Dark theme
  static DropdownMenuThemeData darkDropdownTheme = DropdownMenuThemeData(
    textStyle: const TextStyle(
      color: AppColors.white,
      fontSize: AppSizes.fontMd,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
        vertical: AppSizes.sm,
        horizontal: AppSizes.md,
      ),
      hintStyle: const TextStyle(
        color: AppColors.lightGrey,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.cardRadiusSm),
        borderSide: const BorderSide(color: AppColors.lightGrey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.cardRadiusSm),
        borderSide: const BorderSide(color: AppColors.lightGrey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.cardRadiusSm),
        borderSide: const BorderSide(color: AppColors.white),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.cardRadiusSm),
        borderSide: const BorderSide(color: AppColors.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.cardRadiusSm),
        borderSide: const BorderSide(color: AppColors.error),
      ),
    ),
    menuStyle: MenuStyle(
      backgroundColor: const WidgetStatePropertyAll(AppColors.dark),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(vertical: AppSizes.xs),
      ),
      elevation: const WidgetStatePropertyAll(AppSizes.cardElevation),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.cardRadiusSm),
        ),
      ),
    ),
  );
}
