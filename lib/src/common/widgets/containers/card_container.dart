import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';

class AppCardContainer extends StatelessWidget {
  const AppCardContainer({
    this.height,
    this.width,
    this.backgroundColor,
    this.gradient,
    this.padding,
    this.borderRadius = AppSizes.cardRadiusLg,
    this.applyRadius = true,
    this.hasBorder = false,
    this.borderColor,
    this.borderWidth = 1.0,
    this.child,
    this.onTap,
    this.margin,
    this.applySingleRadius = false,
    this.topLeftRadius = 0.0,
    this.topRightRadius = 0.0,
    this.bottomLeftRadius = 0.0,
    this.bottomRightRadius = 0.0,
    this.applyShadow = false,
    this.shadowColor,
    this.shadowSpreadRadius = 5.0,
    this.shadowBlurRadius = 7.0,
    this.shadowOffsetX = 0.0,
    this.shadowOffsetY = 3.0,
    this.isCircle = false,
    super.key,
  });

  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final Color? borderColor;
  final Gradient? gradient;
  final bool applyRadius;
  final double borderRadius;
  final double? height, width, borderWidth;
  final bool hasBorder;
  final Widget? child;
  final VoidCallback? onTap;
  final bool applySingleRadius;
  final double bottomLeftRadius;
  final double bottomRightRadius;
  final double topLeftRadius;
  final double topRightRadius;
  final bool applyShadow;
  final Color? shadowColor;
  final double shadowSpreadRadius;
  final double shadowBlurRadius;
  final double shadowOffsetX;
  final double shadowOffsetY;
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: margin,
        padding: padding,
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor ?? theme.cardColor,
          gradient: gradient,
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          border: hasBorder
              ? Border.all(
                  color: borderColor ?? theme.dividerColor,
                  width: borderWidth ?? 1.0,
                )
              : null,
          boxShadow: applyShadow
              ? [
                  BoxShadow(
                    color: (shadowColor ?? theme.shadowColor).withAlpha(51),
                    spreadRadius: shadowSpreadRadius,
                    blurRadius: shadowBlurRadius,
                    offset: Offset(shadowOffsetX, shadowOffsetY),
                  ),
                ]
              : null,
          borderRadius: _calculateBorderRadius(),
        ),
        child: child,
      ),
    );
  }

  BorderRadius? _calculateBorderRadius() {
    if (isCircle) return null;
    if (applySingleRadius) {
      return BorderRadius.only(
        topLeft: Radius.circular(topLeftRadius),
        topRight: Radius.circular(topRightRadius),
        bottomLeft: Radius.circular(bottomLeftRadius),
        bottomRight: Radius.circular(bottomRightRadius),
      );
    }
    return applyRadius ? BorderRadius.circular(borderRadius) : null;
  }
}
