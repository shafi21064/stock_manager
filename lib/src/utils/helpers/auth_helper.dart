import 'package:flutter/material.dart';

import '../../features/authentication/views/log_in/model/login_response.dart';
import '../local_storage/local_storage_keys.dart';
import '../local_storage/storage_utility.dart';

class AuthHelper {
  setUserData(AppLoginResponse loginResponse) async {
    print(loginResponse);
    if (loginResponse.result == true) {
      AppLocalStorage().saveDataIfNull(LocalStorageKeys.isLoggedIn, true);
      AppLocalStorage().saveDataIfNull(
          LocalStorageKeys.accessToken, loginResponse.data!.accessToken ?? "");
      AppLocalStorage()
          .saveDataIfNull(LocalStorageKeys.userId, loginResponse.data!.userId);
      AppLocalStorage().saveDataIfNull(
          LocalStorageKeys.userName, loginResponse.data!.user!.name ?? "");
      AppLocalStorage().saveDataIfNull(
          LocalStorageKeys.userEmail, loginResponse.data!.user!.email);
      AppLocalStorage().saveDataIfNull(
          LocalStorageKeys.userPhone, loginResponse.data!.user!.phone);
      //AppLocalStorage().saveDataIfNull(LocalStorageKeys.userHavePassword, loginResponse.user.passwordSaved);
      AppLocalStorage().saveDataIfNull(LocalStorageKeys.avatarOriginal,
          loginResponse.data!.user!.avatar ?? "");
    }
  }

  clearUserData() {
    AppLocalStorage().removeData(LocalStorageKeys.isLoggedIn);
    AppLocalStorage().removeData(LocalStorageKeys.accessToken);
    AppLocalStorage().removeData(LocalStorageKeys.userId);
    AppLocalStorage().removeData(LocalStorageKeys.userName);
    AppLocalStorage().removeData(LocalStorageKeys.userEmail);
    AppLocalStorage().removeData(LocalStorageKeys.userPhone);
    //AppLocalStorage().removeData(LocalStorageKeys.userHavePassword);
    AppLocalStorage().removeData(LocalStorageKeys.avatarOriginal);
  }

  ///this function not use yet

  saveUserDataByToken(userData) {
    AppLocalStorage().saveData(LocalStorageKeys.isLoggedIn, true);
    AppLocalStorage().saveData(LocalStorageKeys.userId, userData.id);
    AppLocalStorage().saveData(LocalStorageKeys.userName, userData.name);
    AppLocalStorage().saveData(LocalStorageKeys.userEmail, userData.email);
    AppLocalStorage().saveData(LocalStorageKeys.userPhone, userData.phone);
    //AppLocalStorage().saveData(LocalStorageKeys.userHavePassword, userData.passwordSaved);
    AppLocalStorage()
        .saveData(LocalStorageKeys.avatarOriginal, userData.avatar);
  }
}
