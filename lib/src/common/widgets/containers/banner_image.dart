import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../styles/skeleton_style.dart';
import 'card_container.dart';

class AppBannerImage extends StatelessWidget {
  const AppBannerImage({
    this.height,
    this.width,
    this.onPress,
    required this.imgUrl,
    this.applyImageRadius = true,
    this.fit = BoxFit.fill,
    this.boarderRadius = AppSizes.cardRadiusMd,
    this.isNetworkImage = false,
    this.imageOpacity = 1.0,
    this.borderWidth,
    this.hasBorder = false,
    this.isFileImage = false,
    this.borderColor,
    this.padding = const EdgeInsets.all(AppSizes.sm),
    this.applyPadding = false,
    this.backgroundColor,
    this.errorImage = AppImages.placeHolder,
    this.applyOnlyBoarderRadius = false,
    super.key,
  });

  final double? height, width, imageOpacity, borderWidth;
  final dynamic imgUrl;
  final bool applyImageRadius, applyPadding;
  final EdgeInsets padding;
  final BoxFit? fit;
  final bool isNetworkImage, hasBorder, isFileImage;
  final double boarderRadius;
  final String errorImage;
  final VoidCallback? onPress;
  final Color? borderColor, backgroundColor;
  final bool applyOnlyBoarderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: AppCardContainer(
        applyRadius: applyImageRadius,
        padding: applyPadding ? padding : const EdgeInsets.all(0),
        height: height,
        width: width,
        hasBorder: hasBorder,
        borderWidth: borderWidth,
        borderColor: borderColor,
        borderRadius: boarderRadius,
        backgroundColor: backgroundColor,
        child: ClipRRect(
          borderRadius: applyOnlyBoarderRadius
              ? BorderRadius.only(
                  bottomLeft: Radius.circular(boarderRadius),
                  bottomRight: Radius.circular(boarderRadius),
                )
              : applyImageRadius
                  ? BorderRadius.circular(boarderRadius)
                  : BorderRadius.zero,
          child: isNetworkImage
              ? CachedNetworkImage(
                  imageUrl: imgUrl as String,
                  fit: fit,
                  placeholder: (context, url) =>
                      ShimmerHelper().buildBasicShimmer(height: 150),
                  errorWidget: (context, url, error) => Image.asset(
                    errorImage,
                    fit: BoxFit.cover,
                  ),
                )
              : isFileImage
                  ? Image.file(
                      imgUrl as File,
                      fit: fit,
                    )
                  : Image.asset(
                      imgUrl as String,
                      fit: fit,
                    ),
        ),
      ),
    );
  }
}
