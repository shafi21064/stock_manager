import 'package:flutter/material.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../styles/spacing_style.dart';
import '../../widgets/appbar/custom_app_bar.dart';

class AppLayoutWithBackButton extends StatelessWidget {
  const AppLayoutWithBackButton(
      {this.bottomNav,
      this.title,
      required this.body,
      this.centerTitle = false,
      this.defaultPadding = true,
      this.action,
      // this.backgroundColor,
      this.customPadding,
      this.showBackArrow = true,
      this.showLeadingIcon = false,
      this.customLeadingIcon,
      this.leadingOnPress,
        this.floatingButton,
      super.key});

  final Widget? title, body, bottomNav;
  final bool centerTitle, defaultPadding;

  // final Color? backgroundColor;
  final List<Widget>? action;
  final EdgeInsetsGeometry? customPadding;
  final bool showBackArrow, showLeadingIcon;
  final IconData? customLeadingIcon;
  final VoidCallback? leadingOnPress;
  final Widget? floatingButton;

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          bottomNavigationBar: bottomNav,
          resizeToAvoidBottomInset: true,
          floatingActionButton: floatingButton,
          // backgroundColor: backgroundColor ?? (isDark? AppColors.scaffoldBackgroundColorDark : AppColors.light),
          appBar: CustomAppBar(
            title: title,
            showBackArrow: showBackArrow,
            centerTitle: centerTitle,
            actions: action,
            showLeadingIcon: showLeadingIcon,
            leadingIcon: customLeadingIcon,
            leadingOnPress: leadingOnPress,
          ),
          body: Padding(
              padding: defaultPadding
                  ? AppSpacingStyle.defaultSpacing
                  : customPadding!,
              child: body)),
    );
  }
}
