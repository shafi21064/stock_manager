import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'widget_themes/appbar_theme.dart';
import 'widget_themes/bottom_sheet_theme.dart';
import 'widget_themes/card_theme.dart';
import 'widget_themes/checkbox_theme.dart';
import 'widget_themes/dialog_theme.dart';
import 'widget_themes/dropdown_theme.dart';
import 'widget_themes/slider_theme.dart';
import 'widget_themes/snack_bar_theme.dart';
import 'widget_themes/tab_bar_theme.dart';
import 'widget_themes/text_field_theme.dart';
import 'widget_themes/text_theme.dart';
import 'widget_themes/chip_theme.dart'; 
import 'widget_themes/elevated_button_theme.dart';
import 'widget_themes/outlined_button_theme.dart';
import 'widget_themes/floating_action_button_theme.dart';


class MyAppTheme {
  MyAppTheme._(); // To avoid creating instances

  static final _baseTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: AppColors.grey,
    primaryColor: AppColors.primary,
  );

  static ThemeData lightTheme = _baseTheme.copyWith(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    textTheme: AppTextTheme.lightTextTheme,
    chipTheme: AppChipTheme.lightChipTheme,
    appBarTheme: CustomAppBarTheme.lightAppBarTheme,
    checkboxTheme: AppCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: AppBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: APPOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: AppTextFormFieldTheme.lightInputDecorationTheme,
    floatingActionButtonTheme: AppFloatingActionButtonTheme.lightFloatingActionButtonTheme,
    dialogTheme: AppDialogTheme.lightDialogTheme,
    sliderTheme: AppSliderTheme.lightSliderTheme,
    tabBarTheme: AppTabBarTheme.lightTabBarTheme,
    snackBarTheme: AppSnackBarTheme.lightSnackBarTheme,
    cardTheme: AppCardTheme.lightCardTheme,
    dropdownMenuTheme: AppDropdownThemes.lightDropdownTheme
  );

  static ThemeData darkTheme = _baseTheme.copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.black,
    textTheme: AppTextTheme.darkTextTheme,
    chipTheme: AppChipTheme.darkChipTheme,
    appBarTheme: CustomAppBarTheme.darkAppBarTheme,
    checkboxTheme: AppCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: AppBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: APPOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: AppTextFormFieldTheme.darkInputDecorationTheme,
    floatingActionButtonTheme: AppFloatingActionButtonTheme.darkFloatingActionButtonTheme,
    dialogTheme: AppDialogTheme.darkDialogTheme,
    sliderTheme: AppSliderTheme.darkSliderTheme,
    tabBarTheme: AppTabBarTheme.darkTabBarTheme,
    snackBarTheme: AppSnackBarTheme.darkSnackBarTheme,
    dropdownMenuTheme: AppDropdownThemes.darkDropdownTheme
  );
}
