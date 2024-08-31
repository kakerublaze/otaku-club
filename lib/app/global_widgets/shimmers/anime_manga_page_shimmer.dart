import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otakuclub/app/core/constants/app_colors.dart';
import 'package:shimmer/shimmer.dart';

Widget getAnimeMangaPageShimmer() {
  return SizedBox(
    height: Get.height * 0.32,
    width: Get.width,
    child: GridView.builder(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 15,
        childAspectRatio: 0.52,
      ),
      itemCount: 39,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(
            10,
          ),
          child: Stack(
            children: [
              Container(
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
                      height: 15,
                      color: AppColor.grey900,
                      width: Get.width * 0.25,
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
                      height: 15,
                      color: AppColor.grey900,
                      width: Get.width * 0.2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
