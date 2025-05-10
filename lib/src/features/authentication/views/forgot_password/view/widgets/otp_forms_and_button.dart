import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import '../../../../../../common/widgets/buttons/app_buttons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../controllers/otp_controller.dart';



class OtpFormsAndButton extends StatelessWidget {
  const OtpFormsAndButton({super.key});

  @override
  Widget build(BuildContext context) {
    OtpController otpController = OtpController.instance;
    return Form(
      key: otpController.otpKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OtpPinField(
            maxLength: 4,
            highlightBorder: true,
            otpPinFieldStyle: const OtpPinFieldStyle(
              activeFieldBorderColor: AppColors.primary,
              fieldBorderWidth: 2,
              fieldBorderRadius: AppSizes.cardRadiusSm,
            ),
            otpPinFieldDecoration: OtpPinFieldDecoration.defaultPinBoxDecoration,
            autoFillEnable: true,
            onSubmit: (String pin) {
              print("OTP Entered: $pin");
            },
            onChange: (String text) {
              print(text);
            },

          ),
          const Gap(AppSizes.xl),
          AppButtons.largeFlatFilledButton(
              onPressed: () {
                otpController.verify();
              },
              buttonText: AppLocalizations.of(context)!.verify),
        ],
      ),
    );
  }
}
