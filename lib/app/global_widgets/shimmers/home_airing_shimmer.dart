import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otakuclub/app/core/constants/app_colors.dart';
import 'package:otakuclub/app/core/utils/extensions.dart';
import 'package:shimmer/shimmer.dart';

Widget getHomeAiringSoonShimmer() {
  return SizedBox(
    width: Get.width,
    height: Get.height * 0.15,
    child: ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          width: Get.width * 0.75,
          height: Get.height * 0.15,
          margin: const EdgeInsets.only(
            right: 15,
          ),
          decoration: BoxDecoration(
            color: AppColor.white30,
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          child: Row(
            children: [
              Shimmer.fromColors(
                baseColor: AppColor.grey800,
                highlightColor: AppColor.grey700,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  child: Container(
                    color: AppColor.grey900,
                    width: Get.width * 0.25,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
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
                    ).paddingOnly(
                      top: 10,
                      left: 10,
                    ),
                  ),
                  5.heightBox,
                  Shimmer.fromColors(
                    baseColor: AppColor.grey800,
                    highlightColor: AppColor.grey700,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      child: Container(
                        height: 20,
                        color: AppColor.grey900,
                        width: Get.width * 0.4,
                      ),
                    ).paddingOnly(
                      top: 10,
                      left: 10,
                    ),
                  ),
                  10.heightBox,
                ],
              )
            ],
          ),
        );
      },
    ),
  );
}
