import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../../../common/layouts/layout_with_back_button/layout_with_back_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../widgets/header_logo_part.dart';
import '../controllers/otp_controller.dart';
import 'widgets/otp_forms_and_button.dart';


class Otp extends StatelessWidget {
  const Otp({super.key});

  @override
  Widget build(BuildContext context) {
    OtpController otpController = Get.put(OtpController());
    return AppLayoutWithBackButton(
        body: ListView(
          children: [
            const HeaderLogoPart(),
            const Gap(AppSizes.lg),
            Text(
              AppLocalizations.of(context)!.verifyYourself,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Gap(AppSizes.lg),
            const OtpFormsAndButton()
          ],
        ),
    );
  }
}