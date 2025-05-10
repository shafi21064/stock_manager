import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../../../common/layouts/layout_with_back_button/layout_with_back_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../log_in/controllers/login_controller.dart';
import '../../widgets/other_login_option.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../controllers/signup_controller.dart';
import 'widgets/signup_forms_and_button.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpPageController signUpController = Get.put(SignUpPageController());
    LogInPageController loginController = Get.put(LogInPageController());
    return const AppLayoutWithBackButton(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(AppImages.darkAppLogo),
              width: AppSizes.imageThumbSize,
            ),
            Gap(AppSizes.lg),
            SignUpFormsAndButton(),
            Gap(AppSizes.lg),
          ],
        ),
      ),
    );
  }
}
