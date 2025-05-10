import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.md),
      width: AppHelperFunctions.screenWidth(),
      decoration: BoxDecoration(
        color: AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
        border: Border.all(color: AppColors.grey)
      ),
      child: Row(
        children: [
          const Icon(Icons.search_outlined, color: AppColors.darkGrey,),
          const Gap(AppSizes.md),
          Text(AppLocalizations.of(context)!.search)
        ],
      ),
    );
  }
}

