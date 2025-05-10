import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../common/widgets/buttons/app_buttons.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/helpers/helper_functions.dart';
import '../../../../../../common/widgets/text_fields/auth_input_field.dart';
import '../../../../../../utils/validators/validation.dart';
import '../../controllers/login_controller.dart';
import 'remember_and_forgot_button.dart';

class LogInFormsAndButton extends StatelessWidget {
  const LogInFormsAndButton({super.key});

  @override
  Widget build(BuildContext context) {
    LogInPageController loginController = LogInPageController.instance;
    bool isDark = AppHelperFunctions.isDarkMode(context);
    return Form(
      key: loginController.logInFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AuthInputField(
            controller: loginController.emailController,
            validator: (value) => AppValidator.validateEmailOrPhone(value),
            hingText: AppLocalizations.of(context)!.emailOrPhoneHintText,
            obscured: false,
          ),
          const Gap(AppSizes.spaceBtwInputFields),
           AuthInputField(
              controller: loginController.passwordController,
              validator: null,
              hingText: AppLocalizations.of(context)!.passwordHintText,
              suffixIcon: InkWell(
                onTap: () {
                  loginController.passwordObscured.value =
                      !loginController.passwordObscured.value;
                },
                child: Icon(loginController.passwordObscured.value
                    ? Icons.remove_red_eye
                    : Icons.remove_red_eye_outlined),
              ),
              obscured: loginController.passwordObscured.value,
            ),
          const RememberAndForgotButton(),
          const Gap(AppSizes.lg),
         AppButtons.largeFlatFilledButton(
                onPressed: () => loginController.emailPasswordLogIn(),
                buttonText: AppLocalizations.of(context)!.login
          ),
          const Gap(AppSizes.md),
        ],
      ),
    );
  }
}
