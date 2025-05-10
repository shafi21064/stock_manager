import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class APPOutlinedButtonTheme {
  APPOutlinedButtonTheme._(); // Prevent instantiation

  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) return AppColors.grey;
        return AppColors.black;
      }),
      side: WidgetStateProperty.resolveWith<BorderSide>((states) {
        if (states.contains(WidgetState.disabled)) {
          return const BorderSide(color: AppColors.grey);
        }
        return const BorderSide(color: AppColors.borderLight);
      }),
      textStyle: WidgetStateProperty.all(
        const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(vertical: AppSizes.buttonVerticalPadding, horizontal: 20),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.buttonRadius)),
      ),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) return AppColors.darkGrey;
        return AppColors.white;
      }),
      side: WidgetStateProperty.resolveWith<BorderSide>((states) {
        if (states.contains(WidgetState.disabled)) {
          return const BorderSide(color: AppColors.darkGrey);
        }
        return const BorderSide(color: AppColors.borderDark);
      }),
      textStyle: WidgetStateProperty.all(
        const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(vertical: AppSizes.buttonVerticalPadding, horizontal: 20),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.buttonRadius)),
      ),
    ),
  );
}
