import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:otakuclub/app/core/constants/app_colors.dart';
import 'package:otakuclub/app/core/constants/app_images.dart';
import 'package:otakuclub/app/core/utils/extensions.dart';
import 'package:otakuclub/app/core/utils/helpers/image_helper.dart';
import 'package:otakuclub/app/modules/anime_details_screen/anime_details_controller.dart';
import 'package:otakuclub/app/routes/app_pages.dart';

class AnimeDetailsPage extends StatelessWidget {
  const AnimeDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      AnimeDetailsPageController(),
    );
    return Obx(
      () {
        return Scaffold(
          appBar: controller.isScrolled.value
              ? AppBar(
                  leading: const Icon(
                    Icons.arrow_back_ios,
                    size: 24,
                    weight: 800,
                    color: AppColor.white,
                  ).onTap(
                    () {
                      Get.back();
                    },
                  ),
                  centerTitle: false,
                  title: Text(
                    controller.animeDataModel.value.title?.english ??
                        controller.animeDataModel.value.title?.native ??
                        controller.animeDataModel.value.title?.userPreferred ??
                        controller.animeDataModel.value.title?.romaji ??
                        '',
                    style: const TextStyle(
                      color: AppColor.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  actions: [
                    const Icon(
                      Icons.share,
                      size: 24,
                      weight: 800,
                      color: AppColor.white,
                    ),
                    20.widthBox,
                  ],
                )
              : null,
          body: controller.isLoading()
              ? const Center(
                  child: SpinKitHourGlass(
                    color: Colors.white,
                    size: 50.0,
                  ),
                )
              : Container(
                  height: Get.height,
                  width: Get.width,
                  decoration: const BoxDecoration(
                    color: AppColor.black,
                  ),
                  child: SingleChildScrollView(
                    controller: controller.scrollController,
                    child: Stack(
                      children: [
                        ShaderMask(
                          shaderCallback: (rect) {
                            return AppColor.getStartedGradient.createShader(
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
                            imagePath:
                                controller.animeDataModel.value.cover ?? '',
                            height: Get.height * 0.25,
                            width: Get.width,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: Get.height * 0.12,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(
                                    Icons.arrow_back_ios,
                                    size: 24,
                                    color: AppColor.white,
                                    weight: 800,
                                  ).onTap(
                                    () {
                                      Get.back();
                                    },
                                  ).paddingOnly(
                                    left: 10,
                                  ),
                                  const Icon(
                                    Icons.share,
                                    size: 24,
                                    weight: 800,
                                    color: AppColor.white,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                  child: ImageHelper(
                                    imagePath:
                                        controller.animeDataModel.value.image ??
                                            '',
                                    height: 200,
                                    width: 140,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                20.widthBox,
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: (Get.width - 210),
                                      child: Text(
                                        controller.animeDataModel.value.title
                                                ?.english ??
                                            controller.animeDataModel.value
                                                .title?.romaji ??
                                            controller.animeDataModel.value
                                                .title?.native ??
                                            '',
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: AppColor.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                    10.heightBox,
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        children: [
                                          const WidgetSpan(
                                            child: ImageHelper(
                                              imagePath: AppImages.tvIcon,
                                              width: 22,
                                              height: 22,
                                              color: AppColor.white,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          WidgetSpan(
                                            child: 10.widthBox,
                                          ),
                                          TextSpan(
                                            text: controller
                                                .animeDataModel.value.type,
                                            style: const TextStyle(
                                              color: AppColor.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    10.heightBox,
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        children: [
                                          const WidgetSpan(
                                            child: ImageHelper(
                                              imagePath: AppImages.durationIcon,
                                              width: 22,
                                              height: 22,
                                              color: AppColor.white,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          WidgetSpan(child: 10.widthBox),
                                          TextSpan(
                                            text:
                                                '${controller.animeDataModel.value.totalEpisodes ?? '-/-'} Episodes',
                                            style: const TextStyle(
                                              color: AppColor.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    10.heightBox,
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        children: [
                                          const WidgetSpan(
                                            child: ImageHelper(
                                              imagePath:
                                                  AppImages.currentStatusIcon,
                                              width: 22,
                                              height: 22,
                                              color: AppColor.white,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          WidgetSpan(child: 10.widthBox),
                                          TextSpan(
                                            text: controller
                                                .animeDataModel.value.status,
                                            style: const TextStyle(
                                              color: AppColor.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            25.heightBox,
                            IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  // Ratings
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: const TextStyle(
                                        color: AppColor.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      children: [
                                        TextSpan(
                                          text:
                                              '${controller.animeDataModel.value.rating ?? '0'}% \n',
                                        ),
                                        TextSpan(
                                          text: 'Avg. Score',
                                          style: TextStyle(
                                            color: AppColor.grey600,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const VerticalDivider(
                                    color: AppColor.grey,
                                    width: 10,
                                    thickness: 2,
                                    indent: 5,
                                    endIndent: 5,
                                  ),
                                  // Adult
                                  // RichText(
                                  //   textAlign: TextAlign.center,
                                  //   text: TextSpan(
                                  //     style: const TextStyle(
                                  //       color: AppColor.white,
                                  //       fontSize: 22,
                                  //       fontWeight: FontWeight.w400,
                                  //     ),
                                  //     children: [
                                  //       const TextSpan(
                                  //         text: 'Adult \n',
                                  //       ),
                                  //       TextSpan(
                                  //           text: (controller.animeDataModel.value
                                  //                       .isAdult ??
                                  //                   false)
                                  //               ? 'Yes'
                                  //               : 'No')
                                  //     ],
                                  //   ),
                                  // ),
                                  // const VerticalDivider(
                                  //   color: AppColor.grey,
                                  //   width: 10,
                                  //   thickness: 2,
                                  //   indent: 5,
                                  //   endIndent: 5,
                                  // ),
                                  // Popularity
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: const TextStyle(
                                        color: AppColor.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      children: [
                                        TextSpan(
                                          text:
                                              '${NumberFormat('#,##0').format(controller.animeDataModel.value.popularity ?? 0)} \n',
                                        ),
                                        TextSpan(
                                          text: 'Popularity',
                                          style: TextStyle(
                                            color: AppColor.grey600,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const VerticalDivider(
                                    color: AppColor.grey,
                                    width: 10,
                                    thickness: 2,
                                    indent: 5,
                                    endIndent: 5,
                                  ),
                                  // Language
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: const TextStyle(
                                        color: AppColor.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      children: [
                                        TextSpan(
                                          text:
                                              '${(controller.animeDataModel.value.countryOfOrigin ?? 'JP')} \n',
                                        ),
                                        TextSpan(
                                          text: 'Language',
                                          style: TextStyle(
                                            color: AppColor.grey600,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            20.heightBox,
                            Text(
                              controller.isExpanded.value
                                  ? controller.removeHtmlTags(
                                      controller.animeDataModel.value
                                              .description ??
                                          '--/--',
                                    )
                                  : controller.removeHtmlTags(
                                      controller
                                              .animeDataModel.value.description
                                              ?.substring(0, 160) ??
                                          '--/--',
                                    ),
                              maxLines: controller.isExpanded.value ? null : 3,
                              overflow: controller.isExpanded.value
                                  ? null
                                  : TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColor.white.withOpacity(0.7),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            10.heightBox,
                            Center(
                              child: Text(
                                controller.isExpanded.value
                                    ? 'Show Less'
                                    : 'Show More',
                                style: const TextStyle(
                                  color: AppColor.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ).onTap(
                                () {
                                  controller.isExpanded.value =
                                      !controller.isExpanded.value;
                                },
                              ),
                            ),
                            20.heightBox,
                            SizedBox(
                              height: 45,
                              child: ListView.builder(
                                itemCount: controller
                                    .animeDataModel.value.genres?.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: const EdgeInsets.only(
                                      left: 15,
                                      right: 15,
                                      top: 5,
                                      bottom: 5,
                                    ),
                                    margin: EdgeInsets.only(
                                      left: index == 0 ? 10 : 20,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: AppColor.white),
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        controller.animeDataModel.value
                                                .genres?[index] ??
                                            '',
                                        style: const TextStyle(
                                          color: AppColor.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            20.heightBox,
                            const Text(
                              'Information',
                              style: TextStyle(
                                color: AppColor.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Table(
                              columnWidths: const {
                                0: FlexColumnWidth(1),
                                1: FlexColumnWidth(2),
                              },
                              children: [
                                controller.buildTableRow(
                                  'Duration',
                                  Text(
                                    '${controller.animeDataModel.value.duration ?? '-/-'}',
                                  ),
                                ),
                                controller.buildTableRow(
                                  'Start Date',
                                  Text(
                                    controller.animeDataModel.value.startDate
                                                ?.year !=
                                            null
                                        ? DateFormat('dd-MM-yyyy')
                                            .format(
                                              DateTime(
                                                controller.animeDataModel.value
                                                        .startDate?.year ??
                                                    1,
                                                controller.animeDataModel.value
                                                        .startDate?.month ??
                                                    1,
                                                controller.animeDataModel.value
                                                        .startDate?.day ??
                                                    1,
                                              ),
                                            )
                                            .toString()
                                        : '-/-',
                                  ),
                                ),
                                controller.buildTableRow(
                                  'End Date',
                                  Text(
                                    controller.animeDataModel.value.endDate
                                                ?.year !=
                                            null
                                        ? DateFormat('dd-MM-yyyy')
                                            .format(
                                              DateTime(
                                                controller.animeDataModel.value
                                                        .endDate?.year ??
                                                    1,
                                                controller.animeDataModel.value
                                                        .endDate?.month ??
                                                    1,
                                                controller.animeDataModel.value
                                                        .endDate?.day ??
                                                    1,
                                              ),
                                            )
                                            .toString()
                                        : '-/-',
                                  ),
                                ),
                                // controller.buildTableRow(
                                //     'Seasons', controller.animeDataModel.value.season),
                                controller.buildTableRow(
                                  'Source',
                                  Text(
                                    controller.animeDataModel.value.type ??
                                        'MANGA',
                                  ),
                                ),
                                controller.buildTableRow(
                                  'Romaji',
                                  Text(
                                    controller.animeDataModel.value.title
                                            ?.romaji ??
                                        '-/-',
                                  ),
                                ),
                                controller.buildTableRow(
                                  'English',
                                  Text(
                                    controller.animeDataModel.value.title
                                            ?.english ??
                                        '-/-',
                                  ),
                                ),
                                controller.buildTableRow(
                                  'Native',
                                  Text(
                                    controller.animeDataModel.value.title
                                            ?.native ??
                                        '-/-',
                                  ),
                                ),
                                controller.buildTableRow(
                                  'Synonyms',
                                  controller.buildSynonymsText(controller
                                          .animeDataModel.value.synonyms ??
                                      []),
                                ),
                              ],
                            ),
                            30.heightBox,
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Episodes',
                                  style: TextStyle(
                                    color: AppColor.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 24,
                                  weight: 800,
                                  color: AppColor.white,
                                ),
                              ],
                            ),
                            20.heightBox,
                            SizedBox(
                              height: 170,
                              width: Get.width,
                              child: ListView.builder(
                                itemCount: (controller.animeDataModel.value
                                                .episodes?.length ??
                                            0) >
                                        40
                                    ? 40
                                    : controller
                                        .animeDataModel.value.episodes?.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          border: Border.all(
                                            color: AppColor.white,
                                          ),
                                        ),
                                        child: Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10,
                                              ),
                                              child: ImageHelper(
                                                imagePath: controller
                                                        .animeDataModel
                                                        .value
                                                        .episodes?[index]
                                                        .image ??
                                                    '',
                                                height: 110,
                                                width: 200,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Positioned(
                                              top: 0,
                                              bottom: 0,
                                              left: 0,
                                              right: 0,
                                              child: Icon(
                                                Icons
                                                    .play_circle_outline_outlined,
                                                size: 48,
                                                color: AppColor.white
                                                    .withOpacity(0.85),
                                                weight: 400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      10.heightBox,
                                      SizedBox(
                                        width: 180,
                                        child: Text(
                                          controller.animeDataModel.value
                                                  .episodes?[index].title ??
                                              '',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: AppColor.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ).onTap(
                                    () {
                                      Get.toNamed(
                                        Routes.videoPlayer,
                                        arguments: {
                                          'id': controller.animeDataModel.value
                                                  .episodes?[index].id ??
                                              '',
                                          'data': controller.animeDataModel
                                              .value.episodes?[index],
                                          'episodes': controller
                                              .animeDataModel.value.episodes,
                                          'recommendation': controller
                                              .animeDataModel
                                              .value
                                              .recommendations,
                                          'name':
                                              '${(controller.animeDataModel.value.title?.english ?? controller.animeDataModel.value.title?.native ?? controller.animeDataModel.value.title?.romaji ?? controller.animeDataModel.value.title?.userPreferred)}',
                                        },
                                      );
                                    },
                                  ).paddingOnly(
                                    left: index == 0 ? 0 : 20,
                                  );
                                },
                              ),
                            ),
                            30.heightBox,
                            const Text(
                              'Casts',
                              style: TextStyle(
                                color: AppColor.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            20.heightBox,
                            SizedBox(
                              height: 170,
                              width: Get.width,
                              child: ListView.builder(
                                itemCount: controller
                                    .animeDataModel.value.characters?.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          50,
                                        ),
                                        child: ImageHelper(
                                          imagePath: controller
                                                  .animeDataModel
                                                  .value
                                                  .characters?[index]
                                                  .image ??
                                              '',
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      20.heightBox,
                                      Text(
                                        controller
                                                .animeDataModel
                                                .value
                                                .characters?[index]
                                                .name
                                                ?.full ??
                                            controller
                                                .animeDataModel
                                                .value
                                                .characters?[index]
                                                .name
                                                ?.native ??
                                            controller
                                                .animeDataModel
                                                .value
                                                .characters?[index]
                                                .name
                                                ?.userPreferred ??
                                            '',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: AppColor.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ).paddingOnly(
                                    left: index == 0 ? 0 : 20,
                                  );
                                },
                              ),
                            ),
                          ],
                        ).paddingOnly(
                          left: 10,
                          right: 10,
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
