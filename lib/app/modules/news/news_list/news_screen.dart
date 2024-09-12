import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otakuclub/app/core/constants/app_colors.dart';
import 'package:otakuclub/app/core/utils/extensions.dart';
import 'package:otakuclub/app/core/utils/helpers/image_helper.dart';
import 'package:otakuclub/app/modules/news/news_list/news_controller.dart';
import 'package:otakuclub/app/routes/app_pages.dart';
import 'package:shimmer/shimmer.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      NewsController(),
    );
    return Obx(
      () {
        return Scaffold(
          body: controller.isLoadingData.value
              ? ListView.builder(
                  itemCount: 15,
                  padding: const EdgeInsets.only(
                    top: 90,
                    left: 10,
                    right: 10,
                    bottom: 80,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColor.grey900,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      margin: EdgeInsets.only(
                        top: 10,
                        bottom:
                            controller.newsData.length - 1 == index ? 20 : 5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            child: Shimmer.fromColors(
                              baseColor: AppColor.grey800,
                              highlightColor: AppColor.grey700,
                              child: Container(
                                height: 120,
                                width: Get.width * 0.25,
                                color: AppColor.grey900,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Shimmer.fromColors(
                                baseColor: AppColor.grey800,
                                highlightColor: AppColor.grey700,
                                child: Container(
                                  height: 20,
                                  width: Get.width * 0.6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                    color: AppColor.grey900,
                                  ),
                                ),
                              ).paddingOnly(
                                top: 30,
                                left: 15,
                                right: 10,
                                bottom: 10,
                              ),
                              Shimmer.fromColors(
                                baseColor: AppColor.grey800,
                                highlightColor: AppColor.grey700,
                                child: Container(
                                  height: 20,
                                  width: Get.width * 0.6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                    color: AppColor.grey900,
                                  ),
                                ),
                              ).paddingOnly(
                                top: 5,
                                left: 15,
                                right: 10,
                                bottom: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                )
              : ListView.builder(
                  itemCount: controller.newsData.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(
                    top: 90,
                    bottom: 80,
                    left: 10,
                    right: 10,
                  ),
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(
                        top: 10,
                        bottom:
                            controller.newsData.length - 1 == index ? 20 : 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        color: AppColor.grey900,
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            child: ImageHelper(
                              imagePath:
                                  controller.newsData[index].thumbnail ?? '',
                              width: Get.width * 0.25,
                              height: 110,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.68,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  controller.newsData[index].title ?? '',
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: AppColor.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ).paddingOnly(
                                  top: 5,
                                  left: 10,
                                  right: 10,
                                  bottom: 5,
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    controller.newsData[index].uploadedAt ?? '',
                                    style: const TextStyle(
                                      color: AppColor.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ).paddingOnly(
                                  right: 10,
                                  bottom: 5,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ).onTap(
                      () {
                        Get.toNamed(
                          Routes.newsDetails,
                          arguments: {
                            'id': controller.newsData[index].id,
                            'image': controller.newsData[index].thumbnail,
                          },
                        );
                      },
                    );
                  },
                ),
        );
      },
    );
  }
}
