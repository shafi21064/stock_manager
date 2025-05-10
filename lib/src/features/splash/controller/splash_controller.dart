import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/local_storage/local_storage_keys.dart';
import '../../../utils/local_storage/storage_utility.dart';
import '../../authentication/views/log_in/view/login.dart';
import '../../bottom_navigation/bottom_navigation.dart';
import '../../on_boarding/views/on_boarding.dart';

class SplashController extends GetxController {
  static SplashController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    //appStatus();
    changeScreen();
  }

  Future<void> appStatus() async {
    //AppStatusModel appStatusModel = await _appStatus.getAppStatus(context);

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    debugPrint(version);

    if (version != '2.0.0') {
      showDialog(
          barrierDismissible: false,
          context: Get.overlayContext!,
          builder: (context) {
            return AlertDialog(
              // backgroundColor: Colors.pink[100],
              icon: const Icon(Icons.update),
              title: const Text('Update here'),
              content: const Text(
                  'New version is available. Please update your app.'),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CupertinoButton(
                        onPressed: () async {
                          AppDeviceUtils.browseUrl(
                              'https://play.google.com/store/apps/details?id=com.thetork.kirei&hl=en&gl=US');
                          //_launchUrl(Uri.parse('${appStatusModel.newVersionDownloadLink}'));
                        },
                        child: const Text(
                          'Update',
                          style: TextStyle(color: Colors.red),
                        )),
                  ],
                ),
              ],
            );
          });
    } else {
      changeScreen();
    }
  }

  changeScreen() {
    final isSocialLogIn =
        AppLocalStorage().readData(LocalStorageKeys.isSocialLogIn) ?? false;
    final isRememberMe =
        AppLocalStorage().readData(LocalStorageKeys.isRememberMe) ?? false;
    final isNotFirst =
        AppLocalStorage().readData(LocalStorageKeys.isNotFirstTime) ?? false;
    Future.delayed(const Duration(seconds: 3), () {
      isNotFirst == true
          ? (isRememberMe || isSocialLogIn
              ? Get.offAll(() => const BottomNavigation())
              : Get.offAll(() => const LogIn()))
          : Get.offAll(() => const OnBoarding());
    });
  }
}
