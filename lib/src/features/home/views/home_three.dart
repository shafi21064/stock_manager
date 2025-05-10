import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../common/layouts/layout_with_drawer/layout_with_drawer.dart';
import '../../../common/styles/skeleton_style.dart';
import '../../../common/widgets/images/banner_image.dart';
import '../../../common/widgets/search_bar/search_bar.dart';
import '../../../common/widgets/slider/view/app_slider.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../controller/home_controller.dart';

class HomeThree extends StatelessWidget {
  const HomeThree({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return AppLayoutWithDrawer(
      globalKey: controller.homeKey,
      title: const Text('Home'),
      body: ListView(
        children: [
          const AppSearchBar(),
          const Gap(AppSizes.md),
          const CustomSlider(items: [
            AppBannerImage(
                imgUrl: AppImages.banner1),
            AppBannerImage(
                imgUrl: AppImages.banner2),
            AppBannerImage(
                imgUrl: AppImages.banner3),
          ], ),
          const Gap(AppSizes.lg),
          ShimmerHelper().buildSquareGridShimmer()
        ],
      )
    );
  }
}

