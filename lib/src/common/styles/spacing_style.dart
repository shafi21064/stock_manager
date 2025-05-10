import 'package:flutter/material.dart';
import '../../utils/constants/sizes.dart';

class AppSpacingStyle{
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: AppSizes.appBarHeight,
    left: AppSizes.lg,
    right: AppSizes.lg,
    bottom: AppSizes.lg
  );

  // static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
  //     top: AppSizes.appBarHeight,
  //     left: AppSizes.defaultSpace,
  //     right: AppSizes.defaultSpace,
  //     bottom: AppSizes.defaultSpace
  // );

  static const EdgeInsetsGeometry defaultSpacing = EdgeInsets.symmetric(
      horizontal: AppSizes.lg
  );

  static const EdgeInsetsGeometry allSIdeSpacing = EdgeInsets.all(
    AppSizes.lg
  );

  static const EdgeInsetsGeometry zeroSpacing = EdgeInsets.zero;
}
