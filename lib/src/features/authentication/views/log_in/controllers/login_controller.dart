import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/helpers/auth_helper.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../../../utils/helpers/network_manager.dart';
import '../../../../../utils/local_storage/local_storage_keys.dart';
import '../../../../../utils/local_storage/storage_utility.dart';
import '../../../../../utils/popups/full_screen_loader.dart';
import '../../../../../utils/popups/loaders.dart';
import '../../../../bottom_navigation/bottom_navigation.dart';
import '../../../data/repositories/auth_repositories.dart';
import '../../forgot_password/view/otp.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../model/login_response.dart';
import '../repository/login_repository.dart';

class LogInPageController extends GetxController {
  static LogInPageController get instance => Get.find();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> logInFormKey = GlobalKey<FormState>();

  Rx<bool> loginWithPassword = false.obs;
  Rx<bool> passwordObscured = true.obs;
  Rx<bool> rememberMe = false.obs;
  Rx<AppLoginResponse> loginResponse = AppLoginResponse().obs;

  Future<void> emailPasswordLogIn() async {
    // final isConnected = await NetworkManager.instance.isConnected();
    try {
      /// Validate Form
      if (!logInFormKey.currentState!.validate()) return;

      /// Start Loading
      // FullScreenLoader.openLoadingDialog(
      //     AppLocalizations.of(Get.overlayContext!)!.processing,
      //     AppImages.loading);

      ///Check Internet
      // if (!isConnected) return;

      ///10 digit or 11 digit
      //   if(emailController.text.startsWith("1")){
      //     emailController.text = "0${emailController.text}";
      //   }

      ///Api Calling
      // loginResponse.value = await LoginRepository().getLoginResponse(
      //   emailController.text.toString(),
      //   passwordController.text.toString(),
      //   rememberMe.value,
      // );

      ///Save
      AppLocalStorage().saveData(LocalStorageKeys.isRememberMe, true);
    } catch (e) {
      /// Error
      AppLoaders.errorSnackBar(title: 'oh, Snap', message: e.toString());
    } finally {
      //FullScreenLoader.stopLoading();
      if (logInFormKey.currentState!.validate()) {
        // if (loginResponse.value.result == true) {
        //   AuthHelper().setUserData(loginResponse.value);
        //   AppHelperFunctions.showToast(loginResponse.value.message.toString());
          Get.offAll(() => const BottomNavigation());
        // } else {
        //   AppHelperFunctions.showToast(loginResponse.value!.message.toString());
        // }
      }
    }
  }

  /// Google SignIn with Api
  // Future<void> onPressedGoogleLogin() async {
  //   try {
  //     //FullScreenLoader.openLoadingDialog("Processing", AppImages.loading);
  //
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //
  //     final GoogleSignInAuthentication? googleAuth =
  //         await googleUser?.authentication;
  //
  //     // final credential = GoogleAuthProvider.credential(
  //     //   accessToken: googleAuth?.accessToken,
  //     //   idToken: googleAuth?.idToken,
  //     // );
  //
  //     print(googleAuth?.accessToken);
  //     print(googleAuth?.idToken);
  //
  //     loginResponse.value = await AuthRepository().getSocialLoginResponse(
  //         provider: "google", accessToken: googleAuth?.accessToken);
  //
  //     if (loginResponse.value.result == false) {
  //       //AppHelperFunctions.showToast(loginResponse.value.message.toString());
  //       AppHelperFunctions.showToast("User Have Cancel login with Google");
  //     } else {
  //       AppHelperFunctions.showToast(loginResponse.value.message.toString());
  //       AppLocalStorage().saveData(LocalStorageKeys.isSocialLogIn, true);
  //       AuthHelper().setUserData(loginResponse.value);
  //       Get.offAll(() => const BottomNavigation());
  //     }
  //     GoogleSignIn().disconnect();
  //     GoogleSignIn().disconnect();
  //   } on Exception catch (e) {
  //     //FullScreenLoader.stopLoading();
  //     //AppHelperFunctions.showToast(e.toString());
  //     AppHelperFunctions.showToast("User Have Cancel login with Google");
  //     print("error is ....... $e");
  //     // TODO
  //   }
  //   return null;
  // }

////////////////////////facebook login //////////////////////
//   Future<AppLoginResponse?> onPressedFacebookLogin() async {
//     try {
//       final LoginResult result = await FacebookAuth.instance.login();
//
//       if (result.status == LoginStatus.success) {
//         final AccessToken? accessToken = result.accessToken;
//         final userData = await FacebookAuth.instance.getUserData();
//
//         // print('this is our facebook response ${userData}');
//
//         loginResponse.value = await AuthRepository().getSocialLoginResponse(
//             provider: "facebook", accessToken: accessToken?.tokenString);
//
//         debugPrint('this is login response $loginResponse');
//
//         if (loginResponse.value.result == true) {
//           AppHelperFunctions.showToast(loginResponse.value.message.toString());
//           AppLocalStorage().saveData(LocalStorageKeys.isSocialLogIn, true);
//           AuthHelper().setUserData(loginResponse.value);
//           Get.offAll(() => const BottomNavigation());
//         }
//         AppHelperFunctions.showToast(loginResponse.value.message!);
//       } else {
//         AppHelperFunctions.showToast(result.message!);
//       }
//     } on Exception catch (e) {
//       AppHelperFunctions.showSimpleSnackBar(e.toString());
//       print("error is ....... $e");
//       // TODO
//     }
//     return null;
//   }

  Future<void> sendCode() async {
    // final isConnected = await NetworkManager.instance.isConnected();
    try {
      ///Check Internet
      // if (!isConnected) return;

      /// Validate Form
      if (!logInFormKey.currentState!.validate()) return;

      /// Start Loading
      //FullScreenLoader.openLoadingDialog('Processing', AppImages.loading);
    } catch (e) {
      /// Error
      AppLoaders.errorSnackBar(title: 'oh, Snap', message: e.toString());
    } finally {
      if (logInFormKey.currentState!.validate()) {
        Get.to(const Otp());
      }
    }
  }
}
