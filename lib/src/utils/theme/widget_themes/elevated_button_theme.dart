import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class AppElevatedButtonTheme {
  AppElevatedButtonTheme._(); // Prevent instantiation

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: WidgetStateProperty.all(0),
      backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.buttonDisabled;
        }
        return AppColors.primary;
      }),
      foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.darkGrey;
        }
        return AppColors.white;
      }),
      overlayColor: WidgetStateProperty.all(AppColors.primary.withAlpha(25)),
      side: WidgetStateProperty.all(const BorderSide(color: AppColors.primary)),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(vertical: AppSizes.buttonVerticalPadding),
      ),
      textStyle: WidgetStateProperty.all(
        const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
        ),
      ),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: WidgetStateProperty.all(0),
      backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.darkerGrey;
        }
        return AppColors.primary;
      }),
      foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.grey;
        }
        return AppColors.white;
      }),
      overlayColor: WidgetStateProperty.all(AppColors.primary.withAlpha(25)),
      side: WidgetStateProperty.all(const BorderSide(color: AppColors.primary)),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(vertical: AppSizes.buttonVerticalPadding),
      ),
      textStyle: WidgetStateProperty.all(
        const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
        ),
      ),
    ),
  );
}
