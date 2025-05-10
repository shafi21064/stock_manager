import 'package:flutter/material.dart';


class AppGridViewLayout extends StatelessWidget {
  const AppGridViewLayout(
      {this.crossAxisCount = 2,
      required this.child,
      required this.itemCount,
      this.childAspectRatioSize = 1.05,
      this.mainAxisExtentValue = 190,
      this.crossAxisSpacing = 10,
      this.mainAxisSpacing = 10,
      super.key});

  final int crossAxisCount, itemCount;
  final double childAspectRatioSize;
  final Function(BuildContext context, int index) child;
  final double mainAxisExtentValue;
  final double mainAxisSpacing;
  final double crossAxisSpacing;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: itemCount,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          mainAxisExtent: mainAxisExtentValue,
          childAspectRatio: childAspectRatioSize,
        ),
        itemBuilder: (context, index) {
          return child(context, index);
        });
  }
}
