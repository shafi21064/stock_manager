import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../utils/local_storage/local_storage_keys.dart';
import '../../../utils/local_storage/storage_utility.dart';
import '../../authentication/views/log_in/view/login.dart';

class OnBoardingController extends GetxController{
  static OnBoardingController get instance => Get.find();


  ///Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;


  /// Update Current Index when Page Scroll
  void updatePageIndicator(index){
    currentPageIndex.value = index;
  }

  /// Jump To specific Page
  void dotNavigationClick(index){
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  /// Update Current Index & Jump To Next Page
  void nextPage(){
    if(currentPageIndex.value == 2){
      AppLocalStorage().saveDataIfNull(LocalStorageKeys.isNotFirstTime, true);
      Get.offAll(const LogIn());
    }else{
      int page = currentPageIndex.value +1;
      pageController.jumpToPage(page);
    }
  }

  /// Skip on-boarding pages
  void skipPage(){
    pageController.jumpToPage(2);
  }
}