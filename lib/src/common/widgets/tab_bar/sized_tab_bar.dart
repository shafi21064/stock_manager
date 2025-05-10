import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants/colors.dart';
import 'tab_controller.dart';


class TabBarViewInfo extends StatelessWidget {
  const TabBarViewInfo({super.key, required this.tabs, required this.tabsView});

  final List<Tab> tabs;
  final List<Widget> tabsView;

  @override
  Widget build(BuildContext context) {
    final tabController = Get.put(AppTabController(myTabsLength: tabs.length));
    return Column(
      children: [
        TabBar(
          controller: tabController.controller,
            isScrollable: true,
            indicator: const BoxDecoration(),
            dividerHeight: 0,
            padding: EdgeInsets.zero,
            //dragStartBehavior: DragStartBehavior.down,
            indicatorColor: AppColors.primary,
            unselectedLabelColor: AppColors.dark,
            labelColor: AppColors.primary,
            tabs: tabs),
        SizedBox(
          height: 300,
          width: MediaQuery.sizeOf(context).width,
          // decoration: const BoxDecoration(
          //   color: Colors.white,
          //
          // ),
          child: TabBarView(
            controller: tabController.controller,
            children: tabsView,
          ),
        )
      ],
    );
  }
}