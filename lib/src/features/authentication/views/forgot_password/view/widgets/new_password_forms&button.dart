import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../../../../../common/widgets/buttons/app_buttons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/helpers/helper_functions.dart';
import '../../../../../../utils/validators/validation.dart';
import '../../../../../../common/widgets/text_fields/auth_input_field.dart';
import '../../controllers/new_password_controller.dart';

class NewPasswordFormsAndButton extends StatelessWidget {
  const NewPasswordFormsAndButton({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = AppHelperFunctions.isDarkMode(context);
    NewPasswordController newPasswordController = NewPasswordController.instance;
    return Form(
      key: newPasswordController.newPasswordKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => AuthInputField(
              controller: newPasswordController.newPassword,
              validator: (value) => AppValidator.validatePassword(value),
              hingText: AppLocalizations.of(context)!.newPasswordHintText,
              obscured: newPasswordController.passwordObscured.value,
              suffixIcon: InkWell(
                onTap: () {
                  newPasswordController.passwordObscured.value =
                      !newPasswordController.passwordObscured.value;
                },
                child: Icon(newPasswordController.passwordObscured.value
                    ? Icons.remove_red_eye
                    : Icons.remove_red_eye_outlined),
              ),
            ),
          ),
          const Gap(AppSizes.spaceBtwInputFields),
          Obx(
            () => AuthInputField(
              controller: newPasswordController.newConfirmPassword,
              validator: (value) => AppValidator.validateConfirmPassword(
                  value, newPasswordController),
              hingText: AppLocalizations.of(context)!.confirmPasswordHintText,
              obscured: newPasswordController.confirmPasswordObscured.value,
              suffixIcon: InkWell(
                onTap: () {
                  newPasswordController.confirmPasswordObscured.value =
                      !newPasswordController.confirmPasswordObscured.value;
                },
                child: Icon(newPasswordController.confirmPasswordObscured.value
                    ? Icons.remove_red_eye
                    : Icons.remove_red_eye_outlined),
              ),
            ),
          ),
          const Gap(AppSizes.md),
          AppButtons.largeFlatFilledButton(
              onPressed: () {
               newPasswordController.submit();
              },
              buttonText: AppLocalizations.of(context)!.submit),
        ],
      ),
    );
  }
}
