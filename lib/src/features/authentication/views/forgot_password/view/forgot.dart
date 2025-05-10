import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../../../common/layouts/layout_with_back_button/layout_with_back_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../widgets/header_logo_part.dart';
import '../controllers/forgot_password_controllers.dart';
import 'widgets/forgot_forms&button.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPasswordController forgotController = Get.put(ForgotPasswordController());
    return AppLayoutWithBackButton(
        body: ListView(
          shrinkWrap: true,
          children: [
            const HeaderLogoPart(),
            const Gap(AppSizes.lg),
            Text(
              AppLocalizations.of(context)!.forgotPassword,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Gap(AppSizes.lg),
            const ForgotFormsAndButton()
          ],
        ),
    );
  }
}
