import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../images/banner_image.dart';
import 'card_container.dart';


class AppNoDataContainer extends StatelessWidget {

  final String? noDataText;
  const AppNoDataContainer({ this.noDataText, super.key});

  @override
  Widget build(BuildContext context) {
    return  AppCardContainer(
      padding: const EdgeInsets.all(AppSizes.md),
      width: AppHelperFunctions.screenWidth(),
      hasBorder: true,
      borderColor: AppColors.borderDark,
      borderWidth: 2,
      // height: 250,
      child: Column(
        children: [
          const AppBannerImage( height: 120, width: 120, imgUrl: AppImages.placeHolder),
          const Gap(AppSizes.md),
          Text(noDataText ?? "No Data Found", style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}

