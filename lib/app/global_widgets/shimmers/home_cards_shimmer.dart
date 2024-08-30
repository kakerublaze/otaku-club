import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otakuclub/app/core/constants/app_colors.dart';
import 'package:shimmer/shimmer.dart';

Widget getHomeCardShimmer() {
  return SizedBox(
    height: Get.height * 0.32,
    width: Get.width,
    child: ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(
            10,
          ),
          child: Stack(
            children: [
              Container(
                height: Get.height * 0.32,
                width: Get.width * 0.36,
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
                      width: Get.width * 0.3,
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
                      width: Get.width * 0.25,
                    ),
                  ),
                ),
              ),
            ],
          ).paddingOnly(
            left: index == 0 ? 0 : 10,
            right: 10,
            bottom: 20,
          ),
        );
      },
    ),
  );
}
