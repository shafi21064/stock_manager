import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/helpers/helper_functions.dart';

class AppTabBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTabBar({required this.tabs, super.key});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFunctions.isDarkMode(context);
    return Material(
      color: isDark? AppColors.black : AppColors.white,
      child: TabBar(
          isScrollable: true,
          indicator: const BoxDecoration(),
          dividerHeight: 0,
          padding: EdgeInsets.zero,
          //dragStartBehavior: DragStartBehavior.down,

          indicatorColor: AppColors.primary,
          unselectedLabelColor: AppColors.dark,
          labelColor: AppColors.primary,
          tabs: tabs
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AppDeviceUtils.getAppBarHeight());
}

