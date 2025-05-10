import 'package:flutter/material.dart';

import '../../widgets/appbar/custom_app_bar.dart';


class AppLayoutWithoutAppBar extends StatelessWidget {
  const AppLayoutWithoutAppBar({
    this.title,
    required this.body,
    this.centerTitle = false,
    this.action,
    this.backgroundColor,
    this.paddingValue = 16.00,
    super.key});

  final Widget? title, body;
  final bool centerTitle;
  final Color? backgroundColor;
  final List<Widget>? action;
  final double? paddingValue;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: title,
        showBackArrow: false,
        showLeadingIcon: false,
        centerTitle: centerTitle,
        actions: action,
      ),
      body: Padding(
          //padding: AppSpacingStyle.defaultSpacing,
          padding: EdgeInsets.symmetric(
            horizontal: paddingValue!
          ),
          child: body
      ),
    );
  }
}

