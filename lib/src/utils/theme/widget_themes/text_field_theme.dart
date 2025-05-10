import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class AppTextFormFieldTheme {
  AppTextFormFieldTheme._();


  // Light Theme
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColors.darkGrey,
    suffixIconColor: AppColors.darkGrey,
    labelStyle: const TextStyle(fontSize: AppSizes.fontMd, color: AppColors.black),
    hintStyle: TextStyle(fontSize: AppSizes.fontSm, color: AppColors.black.withAlpha(179)),
    errorStyle: const TextStyle(fontStyle: FontStyle.normal, color: AppColors.warning),
    floatingLabelStyle: TextStyle(color: AppColors.black.withAlpha(204)),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.grey),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.dark),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.warning),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: AppColors.warning),
    ),
  );


  /// Dark theme for input decoration
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: AppColors.darkGrey,
    suffixIconColor: AppColors.darkGrey,
    labelStyle: const TextStyle(fontSize: AppSizes.fontMd, color: AppColors.white),
    hintStyle: TextStyle(fontSize: AppSizes.fontSm, color: AppColors.white.withAlpha(179)),
    floatingLabelStyle: TextStyle(color: AppColors.white.withAlpha(204)),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.darkGrey),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.darkGrey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.white),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.warning),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: AppColors.warning),
    ),
  );
}
