import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../../../utils/popups/full_screen_loader.dart';
import '../../../../../utils/popups/loaders.dart';
import '../../log_in/view/login.dart';
import '../model/new_password_response.dart';
import '../repository/new_password_repository.dart';
import 'forgot_password_controllers.dart';
import 'otp_controller.dart';

class NewPasswordController extends GetxController {
  static NewPasswordController get instance => Get.find();
  ForgotPasswordController forgetPasswordController = Get.put(ForgotPasswordController());
  OtpController otpController = Get.put(OtpController());

  ///Controllers
  TextEditingController newPassword = TextEditingController();
  TextEditingController newConfirmPassword = TextEditingController();

  Rx<bool> passwordObscured = true.obs;
  Rx<bool> confirmPasswordObscured = true.obs;
  Rx<NewPasswordResponse> newPasswordResponse = NewPasswordResponse().obs;

  GlobalKey<FormState> newPasswordKey = GlobalKey<FormState>();

  Future<void> submit() async {
    // final isConnected = await NetworkManager.instance.isConnected();
    try {
      // /// Start Loading
      // FullScreenLoader.openLoadingDialog(
      //     'Processing', AppImages.loaderAnimation);

      ///Check Internet
      // if (!isConnected) return;

      /// Validate Form
      if (!newPasswordKey.currentState!.validate()) return;

      ///Api Calling
      newPasswordResponse.value = await NewPasswordRepository()
          .getNewPasswordResponse(
              newPassword.text.toString(),
              otpController.otpResponse.value.data!.token.toString(),
              forgetPasswordController.forgotPasswordEmail.text.toString());
    } catch (e) {
      /// Error
      AppLoaders.errorSnackBar(title: 'oh, Snap', message: e.toString());
    } finally {
     // FullScreenLoader.stopLoading();
      if (newPasswordKey.currentState!.validate()) {
        if (newPasswordResponse.value.result == true) {
          AppHelperFunctions.showToast(
              newPasswordResponse.value.data!.message.toString());
          Get.offAll(() => const LogIn());
        }
        {
          AppHelperFunctions.showToast(
              newPasswordResponse.value.data!.message.toString());
        }
      }
    }
  }
}
