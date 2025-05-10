import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../common/styles/spacing_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import 'details_card.dart';


class DetailsPart extends StatelessWidget {
  const DetailsPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSpacingStyle.allSIdeSpacing,
        //color: isDark ? AppColors.darkerGrey : AppColors.white,
      child: Column(
        children: [
          DetailsCard(
              onTap: (){},
              imagePath: AppImages.homeIcon,
              cardText: AppLocalizations.of(context)!.orderDetails,
          ),
          const Gap(AppSizes.md),
          DetailsCard(
            onTap: (){},
            imagePath: AppImages.profileIcon,
            cardText: AppLocalizations.of(context)!.editProfile,
          ),
          const Gap(AppSizes.md),
          DetailsCard(
            onTap: (){},
            imagePath: AppImages.addressIcon,
            cardText: AppLocalizations.of(context)!.address,
          ),
          const Gap(AppSizes.md),
          DetailsCard(
            onTap: (){},
            imagePath: AppImages.translateIcon,
            cardText: AppLocalizations.of(context)!.changeLanguage,
          )
        ],
      ),
    );
  }
}