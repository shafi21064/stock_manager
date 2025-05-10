import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../styles/spacing_style.dart';

class DrawerCard extends StatelessWidget {
  const DrawerCard({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title
  });

  final VoidCallback onTap;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    bool isDark = AppHelperFunctions.isDarkMode(context);
    return Padding(
      padding: AppSpacingStyle.allSIdeSpacing,
      child: InkWell(
        onTap: ()=> onTap(),
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: isDark? AppColors.dark : AppColors.lightContainer,
              borderRadius: BorderRadius.circular(8),
              boxShadow:  [
                BoxShadow(
                     color: isDark? AppColors.darkContainer : AppColors.grey,
                    blurRadius: 10,
                    spreadRadius: 4,
                    offset: const Offset(5, 5))
              ]),
          child: Padding(
            padding: AppSpacingStyle.defaultSpacing,
            child: Row(
              children: [
                Icon(icon),
                const Gap(AppSizes.md),
                Text(
                  title
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}