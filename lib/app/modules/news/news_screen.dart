import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otakuclub/app/core/constants/app_colors.dart';
import 'package:otakuclub/app/core/utils/helpers/image_helper.dart';
import 'package:otakuclub/app/modules/news/news_controller.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      NewsController(),
    );
    return Obx(() {
      return Scaffold(
        body: ListView.builder(
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
                bottom: controller.newsData.length - 1 == index ? 20 : 5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                color: AppColor.grey900,
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(
                        10,
                      ),
                    ),
                    child: Stack(
                      children: [
                        ImageHelper(
                          imagePath: controller.newsData[index].thumbnail ?? '',
                          width: Get.width,
                          height: 160,
                          fit: BoxFit.fill,
                        ),
                        (controller.newsData[index].topics ?? []).isNotEmpty
                            ? Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(
                                        0.7), // Blackish background
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(
                                        10,
                                      ),
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 5,
                                  ), // Add padding inside the container
                                  child: Text(
                                    '# ${(controller.newsData[index].topics ?? [])[0]}',
                                    style: const TextStyle(
                                      color: AppColor.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              )

                            //  Positioned(
                            //     right: 10,
                            //     top: 10,
                            //     child: Container(
                            //       padding: const EdgeInsets.only(
                            //         left: 10,
                            //         right: 10,
                            //         top: 3,
                            //         bottom: 3,
                            //       ),
                            //       decoration: BoxDecoration(
                            //         color: AppColor.white,
                            //         borderRadius: BorderRadius.circular(
                            //           10,
                            //         ),
                            //       ),
                            //       child: Text(
                            //         (controller.newsData[index].topics ??
                            //             [])[0],
                            //         style: const TextStyle(
                            //           color: AppColor.black,
                            //           fontSize: 12,
                            //           fontWeight: FontWeight.w400,
                            //         ),
                            //       ),
                            //     ),
                            //   )
                            : Container(),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.newsData[index].title ?? '',
                        style: const TextStyle(
                          color: AppColor.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ).paddingOnly(
                        top: 10,
                        left: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      const Divider(
                        color: AppColor.white12,
                        thickness: 2,
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
                        right: 15,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      );
    });
  }
}
