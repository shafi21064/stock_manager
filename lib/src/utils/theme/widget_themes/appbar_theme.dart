import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants/sizes.dart';
import '../../constants/colors.dart';

class CustomAppBarTheme {
  CustomAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: AppColors.white,
    surfaceTintColor: AppColors.white,
    iconTheme: IconThemeData(color: AppColors.primary, size: AppSizes.iconMd),
    actionsIconTheme: IconThemeData(color: AppColors.primary, size: AppSizes.iconMd),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
    titleTextStyle: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: AppColors.primary,
    ),
  );

  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: AppColors.darkBackground,
    surfaceTintColor: AppColors.darkBackground,
    iconTheme: IconThemeData(color: AppColors.white, size: AppSizes.iconMd),
    actionsIconTheme: IconThemeData(color: AppColors.white, size: AppSizes.iconMd),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.darkBackground,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
    titleTextStyle: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
  );
}
