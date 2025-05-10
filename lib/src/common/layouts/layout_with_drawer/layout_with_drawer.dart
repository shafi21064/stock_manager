import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../drawer/view/drawer.dart';
import '../../styles/spacing_style.dart';
import '../../widgets/appbar/custom_app_bar.dart';

class AppLayoutWithDrawer extends StatelessWidget {
  const AppLayoutWithDrawer(
      {required this.globalKey,
      required this.title,
      required this.body,
      this.centerTitle = false,
      this.action,
      this.padding = AppSpacingStyle.defaultSpacing,
      super.key});

  final Widget title, body;
  final bool centerTitle;
  final List<Widget>? action;
  final dynamic globalKey;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: globalKey,
      drawer: const AppDrawer(
        userName: 'User Name',
        email: 'example@email.com',
      ),
      appBar: CustomAppBar(
        title: title,
        showBackArrow: false,
        leadingIcon: Icons.menu,
        leadingOnPress: () => globalKey.currentState!.openDrawer(),
        centerTitle: centerTitle,
        //backgroundColor: backgroundColor,
        actions: action,
      ),
      body: Padding(padding: padding, child: body),
    );
  }
}
