import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otakuclub/app/core/constants/app_colors.dart';
import 'package:otakuclub/app/core/utils/extensions.dart';
import 'package:otakuclub/app/core/utils/helpers/image_helper.dart';
import 'package:otakuclub/app/modules/explore/explore_list/explore_list_controller.dart';
import 'package:otakuclub/app/routes/app_pages.dart';

class ExploreListScreen extends StatelessWidget {
  const ExploreListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      ExploreListController(),
    );
    return Obx(
      () {
        return Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          // backgroundColor: AppColor.transparent,
          appBar: PreferredSize(
            preferredSize: Size(
              Get.width,
              60,
            ),
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5,
                ),
                child: AppBar(
                  backgroundColor: AppColor.black.withOpacity(
                    0.4,
                  ),
                  elevation: 0.0,
                  leading: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 24,
                    color: AppColor.white,
                    weight: 800,
                  ).onTap(
                    () {
                      Get.back();
                    },
                  ),
                  leadingWidth: 40,
                  title: Text(
                    controller.getArguments['pageName'] ?? '',
                    style: const TextStyle(
                      color: AppColor.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  titleTextStyle: const TextStyle(
                    color: AppColor.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                  actions: const [],
                ),
              ),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(
                    top: 80,
                  ),
                  controller: controller.scrollController,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.exploreData.length,
                  itemBuilder: (context, index) {
                    if (controller.isLoading.value) {
                      return const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColor.blue,
                          ),
                        ),
                      );
                    }
                    return Container(
                      width: Get.width,
                      margin: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        color: AppColor.grey800,
                      ),
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              child: ImageHelper(
                                imagePath:
                                    controller.exploreData[index].image ?? '',
                                width: Get.width * 0.3,
                                height: 160,
                                fit: BoxFit.fill,
                              ),
                            ),
                            10.widthBox,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: Get.width * 0.6,
                                  child: Text(
                                    controller.exploreData[index].title
                                            ?.english ??
                                        controller
                                            .exploreData[index].title?.romaji ??
                                        controller.exploreData[index].title
                                            ?.userPreferred ??
                                        controller
                                            .exploreData[index].title?.native ??
                                        '',
                                    style: const TextStyle(
                                      color: AppColor.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                10.heightBox,
                                Text(
                                  '${controller.exploreData[index].type ?? ''} ${(controller.exploreData[index].releaseDate ?? '').isNotEmpty ? '•' : ''} ${controller.exploreData[index].releaseDate}',
                                  style: const TextStyle(
                                    color: AppColor.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                5.heightBox,
                                Text(
                                  '★  ${controller.exploreData[index].rating ?? '--'}0%',
                                  style: const TextStyle(
                                    color: AppColor.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ).onTap(() {
                      Get.toNamed(
                        Routes.animeDetailsScreen,
                        arguments: {
                          'id': controller.exploreData[index].id,
                        },
                      );
                    });
                  },
                ),
              ),
            ],
          ).paddingOnly(
            left: 10,
            right: 10,
          ),
        );
      },
    );
  }
}
