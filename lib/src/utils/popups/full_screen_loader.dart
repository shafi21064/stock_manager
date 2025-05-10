import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/widgets/loader/animation_loader.dart';
import '../constants/colors.dart';
import '../helpers/helper_functions.dart';


class FullScreenLoader {
  static void openLoadingDialog(String text, String animation){
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_)=> PopScope(
          canPop: false,
            child: Container(
              color: AppHelperFunctions.isDarkMode(Get.context!) ? AppColors.dark : AppColors.light,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 250,),
                  AppAnimationLoader(animation: animation, text: text)
                ],
              ),
            )));
  }

  static stopLoading(){
    Get.back();
  }
}