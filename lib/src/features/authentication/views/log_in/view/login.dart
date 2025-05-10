import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../../../common/layouts/layout_without_appbar/layout_without_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../sign_up/view/signup.dart';
import '../../widgets/header_logo_part.dart';
import '../controllers/login_controller.dart';
import 'widgets/login_forms&button.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    LogInPageController logInController = Get.put(LogInPageController());
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: AppLayoutWithoutAppBar(
        body: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            const HeaderLogoPart(),
            const Gap(AppSizes.lg),
            const LogInFormsAndButton(),
            const Gap(AppSizes.lg),
            Center(
              child: InkWell(
                onTap: () {
                  Get.to(const SignUp());
                },
                child: Text.rich(
                  TextSpan(
                    text: AppLocalizations.of(context)!.dontHaveAccount,
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: ' ${AppLocalizations.of(context)!.signUp}',
                        style: Theme.of(context).textTheme.titleMedium!.apply(
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
