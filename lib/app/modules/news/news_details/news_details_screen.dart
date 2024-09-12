import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:otakuclub/app/core/constants/app_colors.dart';
import 'package:otakuclub/app/core/utils/extensions.dart';
import 'package:otakuclub/app/core/utils/helpers/image_helper.dart';
import 'package:otakuclub/app/modules/news/news_details/news_details_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      NewsDetailsController(),
    );
    return Obx(
      () {
        return Scaffold(
          body: controller.loader.value
              ? const Center(
                  child: SpinKitHourGlass(
                    color: Colors.white,
                    size: 50.0,
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                    color: AppColor.grey900,
                  ),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ImageHelper(
                            imagePath: controller.getArgs['image'] ?? '',
                            height: Get.height * 0.3,
                            width: Get.width,
                            fit: BoxFit.fill,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.newsData.value.title ?? '',
                                  style: const TextStyle(
                                    color: AppColor.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ).paddingOnly(
                                  left: 15,
                                  right: 15,
                                  top: 15,
                                ),
                                10.heightBox,
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Text(
                                      (controller.newsData.value.description ??
                                              '')
                                          .replaceAllMapped(
                                        RegExp(r'\n\s+'),
                                        (match) {
                                          return '\n';
                                        },
                                      ),
                                      style: const TextStyle(
                                        color: AppColor.white60,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ).paddingOnly(
                                      left: 15,
                                      right: 15,
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  child: Stack(
                                    children: [
                                      // Blurred Image
                                      Container(
                                        height: 90,
                                        width: Get.width,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              controller.getArgs['image'] ?? '',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                            sigmaX: 45,
                                            sigmaY: 45,
                                          ),
                                          child: Container(
                                            color: Colors.black.withOpacity(
                                              0.12,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 90,
                                        width: Get.width,
                                        padding: const EdgeInsets.only(
                                          top: 15,
                                          left: 15,
                                          right: 15,
                                          bottom: 10,
                                        ),
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    '${(controller.newsData.value.title ?? '').length > 75 ? (controller.newsData.value.title ?? '').substring(0, 75) : controller.newsData.value.title}\n',
                                                style: const TextStyle(
                                                  color: AppColor.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              WidgetSpan(
                                                child: 5.heightBox,
                                              ),
                                              const TextSpan(
                                                text: 'Read more',
                                                style: TextStyle(
                                                  color: AppColor.white54,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ).onTap(
                                  () async {
                                    if (await canLaunchUrl(
                                      Uri.parse(
                                        controller.newsData.value.url ?? '',
                                      ),
                                    )) {
                                      launchUrl(
                                        Uri.parse(
                                            controller.newsData.value.url ??
                                                ''),
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 25,
                        left: 15,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            color: AppColor.grey900.withOpacity(
                              0.3,
                            ),
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            size: 20,
                            color: AppColor.white,
                            weight: 900,
                          ),
                        ).onTap(
                          () {
                            Get.back();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
