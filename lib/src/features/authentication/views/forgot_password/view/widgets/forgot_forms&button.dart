import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../../../../common/widgets/buttons/app_buttons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../common/widgets/text_fields/auth_input_field.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/validators/validation.dart';
import '../../controllers/forgot_password_controllers.dart';

class ForgotFormsAndButton extends StatelessWidget {
  const ForgotFormsAndButton({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPasswordController forgotController = ForgotPasswordController.instance;
    return Form(
      key: forgotController.forgotEmailKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AuthInputField(
            controller: forgotController.forgotPasswordEmail,
            hingText: AppLocalizations.of(context)!.emailOrPhoneHintText,
            obscured: false,
            validator: (value) => AppValidator.validateEmailOrPhone(value),
          ),
          const Gap(AppSizes.xl),
          AppButtons.largeFlatFilledButton(
              onPressed: () {
                forgotController.sendCode();
              },
              buttonText: AppLocalizations.of(context)!.sendOtp),
        ],
      ),
    );
  }
}
