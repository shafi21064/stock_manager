import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../utils/constants/app_api_end_points.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../../utils/exceptions/firebase_exceptions.dart';
import '../../../../utils/exceptions/platform_exceptions.dart';
import '../../../../utils/local_storage/local_storage_keys.dart';
import '../../../../utils/local_storage/storage_utility.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../views/log_in/model/login_response.dart';
import '../../views/log_in/view/login.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  // final _auth = FirebaseAuth.instance;

  // //User? get authUser => _auth.currentUser;

  // @override
  // void onReady() {
  //   screenRedirect();
  // }

  // screenRedirect() async {
  //   final user = _auth.currentUser;
  // }

  // /// Google Sign in
  // Future<UserCredential?> signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //     final GoogleSignInAuthentication? googleAuth =
  //         await googleUser?.authentication;

  //     AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth?.accessToken,
  //       idToken: googleAuth?.idToken,
  //     );

  //     return await FirebaseAuth.instance.signInWithCredential(credential);
  //   } on FirebaseAuthException catch (e) {
  //     throw AppFirebaseAuthException(e.code).message;
  //   } on FirebaseException catch (e) {
  //     throw AppFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const FormatException();
  //   } on PlatformException catch (e) {
  //     throw AppPlatformException(e.code).message;
  //   } catch (e) {
  //     debugPrint('Something went wrong');
  //     return Get.offAll(const LogIn());
  //   }
  // }

  /// logout user
  Future<void> logout() async {
    try {
      FullScreenLoader.openLoadingDialog(
          AppLocalizations.of(Get.overlayContext!)!.singingOut,
          AppImages.loading);
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LogIn());
      AppLocalStorage().saveData(LocalStorageKeys.isRememberMe, false);
      AppLocalStorage().saveData(LocalStorageKeys.isSocialLogIn, false);
      FullScreenLoader.stopLoading();
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      FullScreenLoader.stopLoading();
      throw 'Something went wrong';
    }
  }

  // Future<AppLoginResponse> getSocialLoginResponse({
  //   String? provider,
  //   accessToken = "",
  // }) async {
  //   var postBody =
  //       jsonEncode({"provider": provider, "access_token": "$accessToken"});
  //
  //   Uri url = Uri.parse(AppApiEndPoints.socialLogin);
  //
  //   final response = await http.post(url,
  //       headers: {
  //         "Content-Type": "application/json",
  //       },
  //       body: postBody);
  //
  //   var responseBody = jsonDecode(response.body);
  //   print("Response" + responseBody.toString());
  //   return AppLoginResponse.fromJson(responseBody);
  // }

  ///Logout Response
  // Future<LogoutResponse> getLogoutResponse(
  //     String accessToken,
  //     ) async {
  //   Uri url = Uri.parse(AppApiEndPoints.logout);
  //   final response = await http.get(
  //     url,
  //     headers: {
  //       "Content-Type": "application/json",
  //         "Authorization": "Bearer $accessToken",
  //     },
  //   );

  //   print(response.body);

  //   return LogoutResponse.fromJson(jsonDecode(response.body));
  // }
}
