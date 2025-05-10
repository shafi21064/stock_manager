import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../images/banner_image.dart';
import 'card_container.dart';

class AppUserProfileImage extends StatelessWidget {
  final String imgUrl;
  const AppUserProfileImage({
    super.key, required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
           AppCardContainer(
              width: 90,
              height: 90,
              child: AppBannerImage(
                  height: 88,
                  width: 88,
                  applyImageRadius: true,
                  boarderRadius: 100,
                  fit: BoxFit.fill,
                  imgUrl: imgUrl)),
          Positioned(
              right: 0,
              bottom: 5,
              child: AppCardContainer(
                padding: const EdgeInsets.all(AppSizes.xs),
                backgroundColor: AppColors.primary,
                child: InkWell(
                    onTap: () {
                      // detailsController.chooseAndUploadImage();
                    },
                    child: const Icon(
                      Icons.camera,
                      size: AppSizes.iconSm,
                      color: AppColors.white,
                    )),
              ))
        ],
      ),
    );
  }
}