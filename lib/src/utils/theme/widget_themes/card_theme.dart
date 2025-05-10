import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class AppCardTheme {
  AppCardTheme._(); // Prevent instance creation

  static CardTheme lightCardTheme = CardTheme(
    color: AppColors.white,
    elevation: 4.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
  );

  static CardTheme darkCardTheme = CardTheme(
    color: AppColors.black,
    elevation: 4.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
  );
}
