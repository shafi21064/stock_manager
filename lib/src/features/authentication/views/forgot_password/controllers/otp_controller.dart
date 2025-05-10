import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../../../utils/popups/full_screen_loader.dart';
import '../../../../../utils/popups/loaders.dart';
import '../model/otp_response.dart';
import '../repository/otp_repository.dart';
import '../view/new_password.dart';
import 'forgot_password_controllers.dart';

class OtpController extends GetxController {
  static OtpController get instance => Get.find();
  ForgotPasswordController forgetPasswordController = Get.put(ForgotPasswordController());

  ///Controllers
  TextEditingController otpCodeController = TextEditingController();
  TextEditingController firstOtpCodeController = TextEditingController();
  TextEditingController secondOtpCodeController = TextEditingController();
  TextEditingController thirdOtpCodeController = TextEditingController();
  TextEditingController fourthOtpCodeController = TextEditingController();

  GlobalKey<FormState> otpKey = GlobalKey<FormState>();
  Rx<OtpResponse> otpResponse = OtpResponse().obs;

  Future<void> verify() async {
    // final isConnected = await NetworkManager.instance.isConnected();
    try {
      /// Start Loading
      // FullScreenLoader.openLoadingDialog(
      //     'Processing', AppImages.loaderAnimation);

      ///Check Internet
      // if (!isConnected) return;

      /// Validate Form
      if (!otpKey.currentState!.validate()) return;

      /// Api Calling
      otpResponse.value = await OTPRepository().getVerifyOTPResponse(
        forgetPasswordController.forgotPasswordEmail.text.toString(),
        firstOtpCodeController.text.toString(),
        secondOtpCodeController.text.toString(),
        thirdOtpCodeController.text.toString(),
        fourthOtpCodeController.text.toString(),
      );
    } catch (e) {
      /// Error
      AppLoaders.errorSnackBar(title: 'oh, Snap', message: e.toString());
    } finally {
     // FullScreenLoader.stopLoading();
      if (otpKey.currentState!.validate()) {
        if (otpResponse.value.result == true) {
          AppHelperFunctions.showToast(otpResponse.value.message.toString());
          Get.to(() => const NewPassword());
        }
        {
          AppHelperFunctions.showToast(otpResponse.value.message.toString());
        }
      }
    }
  }
}
