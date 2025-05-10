import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';
import '../../styles/spacing_style.dart';

class AppListViewLayout extends StatelessWidget {
  const AppListViewLayout(
      {required this.itemCount,
      required this.builderFunction,
      this.isScrollVertically = true,
        this.isNeedCustomPadding = false,
        this.customPadding = 10.0,
      super.key});

  final int itemCount;
  final bool isScrollVertically;
  final Widget Function(BuildContext context, int index) builderFunction;
  final bool isNeedCustomPadding;
  final double customPadding;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: AppSpacingStyle.zeroSpacing,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: isScrollVertically ? Axis.vertical : Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Padding(
              padding: isScrollVertically
                  ?  EdgeInsets.only(bottom: isNeedCustomPadding == true ? customPadding : AppSizes.md)
                  :  EdgeInsets.only(right: isNeedCustomPadding == true ? customPadding : AppSizes.md),
              child: builderFunction(context, index));
        });
  }
}
