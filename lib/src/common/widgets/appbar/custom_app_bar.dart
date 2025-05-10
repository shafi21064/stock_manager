import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/device/device_utility.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.leadingOnPress,
    required this.showBackArrow,
    this.showLeadingIcon = true,
    this.centerTitle = false,
  });

  final Widget? title;
  final bool showBackArrow, centerTitle, showLeadingIcon;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPress;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconColor = theme.appBarTheme.iconTheme?.color ?? theme.iconTheme.color;

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: theme.appBarTheme.backgroundColor,
      elevation: theme.appBarTheme.elevation ?? 0,
      centerTitle: centerTitle,
      leading: showBackArrow
          ? IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.arrow_back, color: iconColor),
            )
          : showLeadingIcon
              ? IconButton(
                  onPressed: leadingOnPress,
                  icon: Icon(leadingIcon, color: iconColor),
                )
              : null,
      title: title,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppDeviceUtils.getAppBarHeight());
}
