import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class AppTabBarTheme {
  AppTabBarTheme._(); // Prevent instance creation

  static TabBarTheme lightTabBarTheme = const TabBarTheme(
    labelColor: AppColors.primary,
    unselectedLabelColor: AppColors.grey,
    indicatorColor: AppColors.primary,
    indicatorSize: TabBarIndicatorSize.label,
    labelStyle: TextStyle(fontWeight: FontWeight.bold),
    unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
  );

  static TabBarTheme darkTabBarTheme = const TabBarTheme(
    labelColor: AppColors.primary,
    unselectedLabelColor: AppColors.grey,
    indicatorColor: AppColors.primary,
    indicatorSize: TabBarIndicatorSize.label,
    labelStyle: TextStyle(fontWeight: FontWeight.bold),
    unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
  );
}