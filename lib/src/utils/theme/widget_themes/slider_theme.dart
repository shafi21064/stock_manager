import 'package:flutter/material.dart';
import '../../constants/colors.dart';


class AppSliderTheme {
  AppSliderTheme._(); // Prevent instance creation

  static SliderThemeData lightSliderTheme = SliderThemeData(
    activeTrackColor: AppColors.primary,
    inactiveTrackColor: AppColors.grey,
    thumbColor: AppColors.primary,
    overlayColor: AppColors.primary.withAlpha(51),
    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
    trackHeight: 4.0,
  );

  static SliderThemeData darkSliderTheme = SliderThemeData(
    activeTrackColor: AppColors.primary,
    inactiveTrackColor: AppColors.grey,
    thumbColor: AppColors.primary,
    overlayColor: AppColors.primary.withAlpha(51),
    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
    trackHeight: 4.0,
  );
}
