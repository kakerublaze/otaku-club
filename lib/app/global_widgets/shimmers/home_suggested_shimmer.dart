import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otakuclub/app/core/constants/app_colors.dart';
import 'package:shimmer/shimmer.dart';

Widget getHomeSuggestedShimmer() {
  return SizedBox(
    height: Get.height * 0.3,
    width: Get.width,
    child: Stack(
      children: [
        Container(
          height: Get.height * 0.3,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10,
            ),
            color: AppColor.grey900,
          ),
        ),
        Positioned(
          bottom: 40,
          left: 10,
          child: Shimmer.fromColors(
            baseColor: AppColor.grey800,
            highlightColor: AppColor.grey700,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                10,
              ),
              child: Container(
                height: 20,
                color: AppColor.grey900,
                width: Get.width * 0.8,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          left: 10,
          child: Shimmer.fromColors(
            baseColor: AppColor.grey800,
            highlightColor: AppColor.grey700,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                10,
              ),
              child: Container(
                height: 20,
                color: AppColor.grey900,
                width: Get.width * 0.6,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
