import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class AppButtons {
  static ElevatedButton smallRoundButton({
    required VoidCallback onPressed,
    required Color buttonColor,
    required Widget buttonChild,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: buttonColor,
      ),
      child: buttonChild,
    );
  }

  static InkWell iconRoundButton({
    required VoidCallback onPressed,
    required Color buttonColor,
    required IconData icon,
    required double iconSize,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(AppSizes.sm),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: buttonColor,
        ),
        child: Icon(
          icon,
          size: iconSize,
          color: Theme.of(Get.context!).iconTheme.color, // Adjust icon color for theme
        ),
      ),
    );
  }

  static ElevatedButton largeFlatFilledButton({
    required VoidCallback onPressed,
    required String buttonText,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(AppHelperFunctions.screenWidth(), AppSizes.buttonHeight)
      ),
      child: Text(
        buttonText,
      ),
    );
  }

  static OutlinedButton largeFlatOutlineButton({
    required VoidCallback onPressed,
    required String buttonText,
    bool isBorderRadiousSize = false,
    double borderRediousSize = 0.0,
    Color buttonTextColor = AppColors.textPrimary,
    double fontSizes = 18,
    FontWeight fontWeight = FontWeight.w500,
    bool isPadding = false,
    Color borderColor = AppColors.secondary,
    double borderWidth = 1.0,
  }) {

    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize:
            Size(AppHelperFunctions.screenWidth(), AppSizes.buttonHeight),
      ),
      child: Text(
        buttonText,
      ),
    );
  }

  static GestureDetector largeFlatOutlineWithImageButton({
    required VoidCallback onPressed,
    required String buttonText,
    bool isBorderRadiousSize = false,
    double borderRediousSize = 0.0,
    Color buttonTextColor = AppColors.textPrimary,
    required String iconPath,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 52,
        width: AppHelperFunctions.screenWidth(),
        decoration: BoxDecoration(
          borderRadius: isBorderRadiousSize == true
              ? BorderRadius.circular(borderRediousSize)
              : BorderRadius.zero,
          border: Border.all(
            color: AppColors.borderDark,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              height: 20,
              width: 20,
            ),
            const Gap(AppSizes.md),
            Text(
              buttonText,
              style: TextStyle(
                color: buttonTextColor,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Container smallIconButton({
    required VoidCallback onIconPress,
    required String iconPath,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: onIconPress,
        icon: Image(
          width: AppSizes.iconMd,
          height: AppSizes.iconMd,
          image: AssetImage(iconPath),
        ),
      ),
    );
  }

  static floatingButtonWithLabel({
    required onPressed,
    required label,
    labelColor = AppColors.white,
    backgroundColor = AppColors.secondary,
  }) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      label: Text(
        label,
        style: const TextStyle(color: AppColors.white),
      ),
      elevation: 10,
      backgroundColor: backgroundColor,
    );
  }
}
