import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../controllers/on_boarding_controller.dart';


class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    OnBoardingController   skipController = OnBoardingController.instance;
    return Positioned(
      top: AppDeviceUtils.getAppBarHeight(),
      right: AppSizes.lg,
      child: TextButton(
        onPressed: (){
          skipController.skipPage();
        },
        child: Text(AppLocalizations.of(context)!.skip),
      ),
    );
  }
}
