import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:otakuclub/app/core/constants/app_colors.dart';
import 'package:shimmer/shimmer.dart';

Widget getShimmerPlaceholder({
  double? height,
  double? width,
  Widget? child,
}) {
  return SizedBox(
    height: Get.height * 0.2,
    width: Get.width,
    child: Stack(
      children: [
        Shimmer.fromColors(
          baseColor: AppColor.grey900,
          highlightColor: AppColor.grey800,
          child: Container(
            margin: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            decoration: BoxDecoration(
              color: AppColor.grey900,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Positioned(
          bottom: 50,
          left: 25,
          child: Shimmer.fromColors(
            baseColor: AppColor.grey800,
            highlightColor: AppColor.grey700,
            child: Container(
              width: Get.width * 0.8,
              height: 20,
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              decoration: BoxDecoration(
                color: AppColor.grey900,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 25,
          child: Shimmer.fromColors(
            baseColor: AppColor.grey800,
            highlightColor: AppColor.grey700,
            child: Container(
              width: Get.width * 0.5,
              height: 20,
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              decoration: BoxDecoration(
                color: AppColor.grey900,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
