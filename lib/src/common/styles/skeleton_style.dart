import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../utils/constants/colors.dart';



class ShimmerHelper {
  buildBasicShimmer(
      {double height = double.infinity, double width = double.infinity}) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey,
      highlightColor: AppColors.lightGrey.withOpacity(.5),
      child: Container(
        height: height,
        width: width,
        color: Colors.white,
      ),
    );
  }

  buildAddressLoadingShimmer(
      {double height = double.infinity, double width = double.infinity}) {
    return Shimmer.fromColors(
      baseColor: AppColors.white,
      highlightColor: AppColors.white,
      child: Container(
        height: height,
        width: width,
        color: Colors.white,
      ),
    );
  }

  buildListShimmer({itemCount = 10, itemHeight = 100.0}) {
    return ListView.builder(
      itemCount: itemCount,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(
              top: 0.0, left: 16.0, right: 16.0, bottom: 16.0),
          child: ShimmerHelper().buildBasicShimmer(height: itemHeight),
        );
      },
    );
  }

  buildProductGridShimmer({sController, itemCount = 10}) {
    return GridView.builder(
      itemCount: itemCount,
      controller: sController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7),
      padding: const EdgeInsets.all(8),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Shimmer.fromColors(
            baseColor: AppColors.grey,
            highlightColor: AppColors.grey,
            child: Container(
              height: 120,
              width: double.infinity,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }

  buildHomeProductGridShimmer({sController, itemCount = 10}) {
    return GridView.builder(
      itemCount: itemCount,
      controller: sController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.85),
      padding: const EdgeInsets.all(8),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Shimmer.fromColors(
            baseColor: AppColors.primary.withOpacity(0.04),
            highlightColor: AppColors.primary.withOpacity(0.08),
            child: Container(
              height: 120,
              width: double.infinity,
              color: AppColors.primary,
            ),
          ),
        );
      },
    );
  }

  // buildHomeProductGridShimmer({scontroller, item_count = 10}) {
  //   return ListView.builder(
  //     scrollDirection: Axis.horizontal,
  //     itemCount: item_count,
  //     controller: scontroller,
  //     // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //     //     crossAxisCount: 2,
  //     //     crossAxisSpacing: 10,
  //     //     mainAxisSpacing: 10,
  //     //     childAspectRatio: 0.85),
  //     padding: EdgeInsets.all(8),
  //     physics: NeverScrollableScrollPhysics(),
  //     shrinkWrap: true,
  //     itemBuilder: (context, index) {
  //       return Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Shimmer.fromColors(
  //           baseColor: MyTheme.light_grey,
  //           highlightColor: MyTheme.light_grey,
  //           child: Container(
  //             height: 120,
  //             width: 60,
  //             color: Colors.white,
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  buildSquareGridShimmer({sController, itemCount = 10}) {
    return GridView.builder(
      itemCount: itemCount,
      controller: sController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1
      ),
      padding: const EdgeInsets.all(8),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Shimmer.fromColors(
            baseColor: AppColors.grey,
            highlightColor: AppColors.lightGrey,
            child: Container(
              height: 120,
              width: double.infinity,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}