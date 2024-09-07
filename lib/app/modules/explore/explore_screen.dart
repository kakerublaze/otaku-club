import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otakuclub/app/core/constants/app_colors.dart';
import 'package:otakuclub/app/core/utils/extensions.dart';
import 'package:otakuclub/app/core/utils/helpers/image_helper.dart';
import 'package:otakuclub/app/global_widgets/header_title_widget.dart';
import 'package:otakuclub/app/modules/explore/explore_screen_controller.dart';
import 'package:otakuclub/app/routes/app_pages.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      ExploreController(),
    );
    return Obx(
      () {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Column(
                children: [
                  90.heightBox,
                  Container(
                    height: 50,
                    width: Get.width,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor.white,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.search,
                          weight: 800,
                          color: AppColor.white,
                          size: 24,
                        ).paddingOnly(
                          right: 20,
                        ),
                        Expanded(
                          child: TextField(
                            controller: controller.exploreController,
                            style: const TextStyle(
                              color: AppColor.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.left,
                            decoration: const InputDecoration(
                              fillColor: AppColor.white,
                              // Borders made transparent
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              focusColor: AppColor.white,
                              // Hint Text
                              hintText: 'Explore More Animes',
                              hintStyle: TextStyle(
                                color: AppColor.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            onChanged: (value) {
                              controller.searchAnime(
                                value,
                              );
                              controller.searchedAnimeList.refresh();
                            },
                          ),
                        ),
                      ],
                    ).paddingOnly(
                      left: 20,
                      right: 20,
                    ),
                  ),
                ],
              ).paddingOnly(
                left: 10,
                right: 10,
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    if (controller.searchedAnimeList.isNotEmpty &&
                        controller.exploreController.text.length > 3)
                      30.heightBox,
                    if (controller.searchedAnimeList.isNotEmpty &&
                        controller.exploreController.text.length > 3)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Searched Animes',
                            style: TextStyle(
                              color: AppColor.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'View All',
                                  style: TextStyle(
                                    color: AppColor.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                WidgetSpan(
                                  child: SizedBox(
                                    width: 10,
                                  ),
                                ),
                                WidgetSpan(
                                  child: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 20,
                                    weight: 800,
                                    color: AppColor.white,
                                  ),
                                ),
                              ],
                            ),
                          ).onTap(
                            () {
                              Get.toNamed(
                                Routes.exploreList,
                                arguments: {
                                  'pageName': 'Query',
                                  'query': controller.exploreController.text,
                                },
                              );
                            },
                          ),
                        ],
                      ).paddingOnly(
                        bottom: 20,
                      ),
                    if (controller.searchedAnimeList.isNotEmpty &&
                        controller.exploreController.text.length > 3)
                      SizedBox(
                        height: Get.height * 0.26,
                        width: Get.width,
                        child: ListView.builder(
                          itemCount: controller.searchedAnimeList.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            var anime = controller.searchedAnimeList[index];
                            return Container(
                              padding: EdgeInsets.only(
                                left: index == 0 ? 0 : 10,
                                right: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                child: Stack(
                                  children: [
                                    ShaderMask(
                                      shaderCallback: (rect) {
                                        return AppColor.cardsGradientColor
                                            .createShader(
                                          Rect.fromLTRB(
                                            0,
                                            0,
                                            Get.width,
                                            rect.height,
                                          ),
                                        );
                                      },
                                      blendMode: BlendMode.dstOut,
                                      child: ImageHelper(
                                        imagePath: anime.image ?? '',
                                        height: Get.height * 0.26,
                                        width: Get.width * 0.36,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      left: 5,
                                      right: 5,
                                      child: SizedBox(
                                        width: Get.width * 0.35,
                                        child: Text(
                                          anime.title?.english ??
                                              anime.title?.userPreferred ??
                                              anime.title?.romaji ??
                                              anime.title?.native ??
                                              '',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                          style: const TextStyle(
                                            color: AppColor.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    if (controller.exploreController.text.length > 3 &&
                        controller.searchedAnimeList.isEmpty)
                      Container(
                        decoration: BoxDecoration(
                          color: AppColor.grey800,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'No data found\nTry searching another anime...',
                            style: TextStyle(
                              color: AppColor.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ).paddingOnly(
                          top: 20,
                          bottom: 20,
                        ),
                      ).paddingOnly(
                        top: 30,
                      ),
                    30.heightBox,
                    getHeaderWidget(
                      title: 'Explore More',
                      showArrow: false,
                      fontSize: 24,
                    ),
                    20.heightBox,
                    GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 3,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.exploreMapDataList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return IntrinsicHeight(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: AppColor.grey800,
                              border: Border.all(
                                color: AppColor.white,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                controller.exploreMapDataList[index],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.white,
                                ),
                              ),
                            ),
                          ),
                        ).onTap(
                          () {
                            controller.exploreMapDataList[index] == 'Calendar'
                                ? Get.showSnackbar(
                                    const GetSnackBar(
                                      message:
                                          'This Page is Still in development :(',
                                      backgroundColor: AppColor.red,
                                      duration: Duration(
                                        milliseconds: 1000,
                                      ),
                                    ),
                                  )
                                : Get.toNamed(
                                    Routes.exploreList,
                                    arguments: {
                                      'pageName':
                                          controller.exploreMapDataList[index],
                                    },
                                  );
                          },
                        );
                      },
                    ),
                    90.heightBox,
                  ],
                ).paddingOnly(
                  left: 10,
                  right: 10,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
