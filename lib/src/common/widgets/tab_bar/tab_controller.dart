
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AppTabController extends GetxController with GetSingleTickerProviderStateMixin {
  AppTabController({required this.myTabsLength});
   final int myTabsLength;

  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: myTabsLength);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}