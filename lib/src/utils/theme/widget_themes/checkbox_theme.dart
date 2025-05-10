import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/// Custom Checkbox Themes for Light & Dark Modes
class AppCheckboxTheme {
  AppCheckboxTheme._();

  static final lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSizes.xs),
    ),
    side: const BorderSide(color: AppColors.borderLight),
    checkColor: WidgetStateProperty.resolveWith((states) =>
        states.contains(WidgetState.selected) ? AppColors.white : AppColors.black),
    fillColor: WidgetStateProperty.resolveWith((states) =>
        states.contains(WidgetState.selected) ? AppColors.primary : Colors.transparent),
    overlayColor: WidgetStateProperty.all(AppColors.primary.withAlpha(26)),
    splashRadius: 18,
  );

  static final darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSizes.xs),
    ),
    side: const BorderSide(color: AppColors.borderDark),
    checkColor: WidgetStateProperty.resolveWith((states) =>
        states.contains(WidgetState.selected) ? AppColors.white : AppColors.black),
    fillColor: WidgetStateProperty.resolveWith((states) =>
        states.contains(WidgetState.selected) ? AppColors.primary : Colors.transparent),
    overlayColor: WidgetStateProperty.all(AppColors.primary.withAlpha(51)),
    splashRadius: 18,
  );
}
