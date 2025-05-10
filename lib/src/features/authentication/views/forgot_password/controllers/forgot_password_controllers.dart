import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../../../utils/popups/full_screen_loader.dart';
import '../../../../../utils/popups/loaders.dart';
import '../model/forget_password_response.dart';
import '../repository/forget_password_repository.dart';
import '../view/otp.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  ///Controllers
  final forgotPasswordEmail = TextEditingController();
  Rx<ForgetPasswordResponse> forgetPasswordResponse =
      ForgetPasswordResponse().obs;

  GlobalKey<FormState> forgotEmailKey = GlobalKey<FormState>();

  Future<void> sendCode() async {
    // final isConnected = await NetworkManager.instance.isConnected();
    try {
      ///Check Internet
      // if (!isConnected) return;

      /// Validate Form
      if (!forgotEmailKey.currentState!.validate()) return;

      // /// Start Loading
      // FullScreenLoader.openLoadingDialog('Processing', AppImages.loading);

      /// Api Calling
      // forgetPasswordResponse.value = await ForgotPasswordRepository()
      //     .getForgetPasswordResponse(forgotPasswordEmail.text.toString());
    } catch (e) {
      /// Error
      AppLoaders.errorSnackBar(title: 'oh, Snap', message: e.toString());
    } finally {
      // FullScreenLoader.stopLoading();
      if (forgotEmailKey.currentState!.validate()) {
        // if (forgetPasswordResponse.value.result == true) {
        //   AppHelperFunctions.showToast(
        //       forgetPasswordResponse.value.message.toString());
          Get.to(() => const Otp());
        // }else {
        //   AppHelperFunctions.showToast(
        //       forgetPasswordResponse.value.message.toString());
        // }
      }
    }
  }
}
