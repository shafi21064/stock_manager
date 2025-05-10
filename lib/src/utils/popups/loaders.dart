import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../helpers/helper_functions.dart';


class AppLoaders {
  static hideSnackBar() =>
      ScaffoldMessenger.of(Get.overlayContext!).hideCurrentSnackBar();

  static customToast(String message) {
    ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppHelperFunctions.isDarkMode(Get.overlayContext!)
                  ? AppColors.darkGrey.withAlpha(230)
                  : AppColors.grey.withAlpha(230)),
          child: Center(
            child: Text(
              message,
              style: Theme.of(Get.overlayContext!).textTheme.labelLarge,
            ),
          ),
        )));
  }

  static successSnackBar({required title, message = '', duration = 3}) {
    AppHelperFunctions.getSnackBar(
        title: title,
        message: message,
        duration: duration,
        backgroundColor: AppColors.primary,
        icon: Icons.check);
  }

  static warningSnackBar({required title, message = '', duration = 3}) {
    AppHelperFunctions.getSnackBar(
        title: title,
        message: message,
        duration: duration,
        backgroundColor: AppColors.warning,
        icon: Icons.warning);
  }

  static errorSnackBar({required title, message = '', duration = 3}) {
    AppHelperFunctions.getSnackBar(
        title: title,
        message: message,
        duration: duration,
        backgroundColor: AppColors.error,
        icon: Icons.warning);
  }
}
