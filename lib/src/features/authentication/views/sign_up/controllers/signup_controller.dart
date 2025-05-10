import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../../utils/helpers/auth_helper.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../../../utils/helpers/network_manager.dart';
import '../../../../../utils/local_storage/local_storage_keys.dart';
import '../../../../../utils/local_storage/storage_utility.dart';
import '../../../../../utils/popups/full_screen_loader.dart';
import '../../../../../utils/popups/loaders.dart';
import '../../../../bottom_navigation/bottom_navigation.dart';
import '../../log_in/model/login_response.dart';
import '../repository/signup_repository.dart';

class SignUpPageController extends GetxController {
  static SignUpPageController get instance => Get.find();

  ///Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  Rx<bool> passwordObscured = true.obs;
  Rx<bool> confirmPasswordObscured = true.obs;
  Rx<bool> checkboxValue = false.obs;
  Rx<AppLoginResponse> signupResponse = AppLoginResponse().obs;

  RxString selectedRole = 'Executive'.obs;
  List<String> userRoles = ['Executive', 'Admin'];

  void setCheckboxValue() {
    checkboxValue.value = !checkboxValue.value;
  }

  Future<void> signUp() async {
    // final isConnected = await NetworkManager.instance.isConnected();

      /// Start Loading
      // FullScreenLoader.openLoadingDialog(
      //     AppLocalizations.of(Get.overlayContext!)!.processing,
      //     AppImages.loaderAnimation);

      ///Check Internet
      // if (!isConnected) return;

      // ///10 digit or 11 digit
      // if(emailController.text.startsWith("1")){
      //   emailController.text = "0${emailController.text}";
      // }

      /// Validate Form
      if (!signupFormKey.currentState!.validate()) return;

      // if (!checkboxValue.value) {
      //    AppHelperFunctions.showToast("Please Agree to UyLab Terms & conditions");
      // }

      ///Api Calling
      signupResponse.value = await SignupRepository().getSignupResponse(
        emailController.text.toString(),
        passwordController.text.toString(),
      );
      ///Save
      AppLocalStorage().saveData(LocalStorageKeys.isRememberMe, true);
      //FullScreenLoader.stopLoading();
        if (signupResponse.value.result == true) {
          AuthHelper().setUserData(signupResponse.value);
          Get.offAll(() => const BottomNavigation());
        }
    AppHelperFunctions.showToast(signupResponse.value.message.toString());


  }
}
