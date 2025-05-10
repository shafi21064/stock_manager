import 'package:carousel_slider/carousel_slider.dart' as carousel;
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../images/banner_image.dart';
import '../controller/slider_controller.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    required this.items,
    super.key,
  });

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SliderController());
    return Stack(
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        carousel.CarouselSlider(
            items: items,
            options: carousel.CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, _) =>
                    controller.updateCurrentIndex(index),
                autoPlay: true)),
        Obx(() => Positioned.fill(
          bottom: 10,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedSmoothIndicator(
              activeIndex: controller.carouselCurrentIndex.value,
              count: items.length,
              effect: const WormEffect(
                activeDotColor: AppColors.primary,
                dotHeight: 6
              ),
            ),
          ),
        ) )

        //SmoothPageIndicator(controller: controller.pageController, count: items.length)
      ],
    );
  }
}
