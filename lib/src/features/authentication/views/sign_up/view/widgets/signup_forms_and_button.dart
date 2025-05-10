import 'package:boilerplate/src/common/widgets/drop_down/full_field_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../../../../common/widgets/buttons/app_buttons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/helpers/helper_functions.dart';
import '../../../log_in/view/login.dart';
import '../../../../../../common/widgets/text_fields/auth_input_field.dart';
import '../../controllers/signup_controller.dart';

class SignUpFormsAndButton extends StatelessWidget {
  const SignUpFormsAndButton({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpPageController signUpController = SignUpPageController.instance;
    bool isDark = AppHelperFunctions.isDarkMode(context);
    return Form(
      key: signUpController.signupFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        AuthInputField(
              controller: signUpController.passwordController,
              validator: null,
              hingText: AppLocalizations.of(context)!.emailOrPhoneHintText,
              obscured: signUpController.passwordObscured.value,
            ),
          const Gap(AppSizes.spaceBtwInputFields),
          Obx(
            () => AuthInputField(
              controller: signUpController.passwordController,
              validator: null,
              hingText: AppLocalizations.of(context)!.passwordHintText,
              suffixIcon: InkWell(
                onTap: () {
                  signUpController.passwordObscured.value =
                      !signUpController.passwordObscured.value;
                },
                child: Icon(signUpController.passwordObscured.value
                    ? Icons.remove_red_eye
                    : Icons.remove_red_eye_outlined),
              ),
              obscured: signUpController.passwordObscured.value,
            ),
          ),
          const Gap(AppSizes.spaceBtwInputFields),
          Obx(
            () => AuthInputField(
              controller: signUpController.confirmPasswordController,
              validator: null,
              hingText: AppLocalizations.of(context)!.confirmPasswordHintText,
              suffixIcon: InkWell(
                onTap: () {
                  signUpController.confirmPasswordObscured.value =
                      !signUpController.confirmPasswordObscured.value;
                },
                child: Icon(signUpController.confirmPasswordObscured.value
                    ? Icons.remove_red_eye
                    : Icons.remove_red_eye_outlined),
              ),
              obscured: signUpController.confirmPasswordObscured.value,
            ),
          ),
          const Gap(AppSizes.spaceBtwInputFields),
          AppFullFieldDropDown(
            hintText: "Choose user type",
            dropDownOptions: signUpController.userRoles,
            selectedValue: signUpController.selectedRole.value,
            onChanged: (value) {
              signUpController.selectedRole.value = value!;
            },
          ),
          const Gap(AppSizes.xl),
          AppButtons.largeFlatFilledButton(
              onPressed: () {
                signUpController.signUp();
              },
              buttonText: AppLocalizations.of(context)!.signUp),
          const Gap(AppSizes.md),
          AppButtons.largeFlatOutlineButton(
              onPressed: () {
                Get.offAll(const LogIn());
              },
              buttonText: AppLocalizations.of(context)!.login)
        ],
      ),
    );
  }
}
