import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:otakuclub/app/core/utils/extensions.dart';
import 'package:otakuclub/app/core/utils/helpers/image_helper.dart';
import 'package:otakuclub/app/global_widgets/header_title_widget.dart';
import 'package:otakuclub/app/modules/video_player/video_player_controller.dart';
import 'package:otakuclub/app/routes/app_pages.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constants/app_colors.dart';

class VideoPlayerScreen extends StatelessWidget {
  const VideoPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      VideoPlayerController(),
    );
    return Obx(
      () {
        return Scaffold(
          appBar: AppBar(
            leading: const Icon(
              Icons.arrow_back_ios,
              size: 24,
              weight: 800,
              color: AppColor.white,
            ).onTap(
              () {
                Get.back();
              },
            ).paddingOnly(
              left: 15,
            ),
            centerTitle: false,
            leadingWidth: 30,
            title: SizedBox(
              // width: Get.width * 0.7,
              height: 30,
              child: Text(
                controller.getArguments['name'],
                style: const TextStyle(
                  color: AppColor.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
                // scrollAxis: Axis.horizontal,
                // crossAxisAlignment: CrossAxisAlignment.start,
                // blankSpace: 20.0,
                // velocity: 100.0,
                // pauseAfterRound: const Duration(seconds: 1),
                // startPadding: 10.0,
                // decelerationDuration: const Duration(milliseconds: 500),
                // decelerationCurve: Curves.easeOut,
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
          ),
          body: controller.isLoading()
              ? const Center(
                  child: SpinKitThreeInOut(
                    color: Colors.white,
                    size: 50.0,
                  ),
                )
              : Column(
                  children: [
                    10.heightBox,
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: BetterPlayer(
                        controller: controller.betterPlayerController.value ??
                            BetterPlayerController(
                              const BetterPlayerConfiguration(
                                aspectRatio: 16 / 9,
                                fit: BoxFit.contain,
                              ),
                            ),
                      ),
                    ),
                    10.heightBox,
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 80,
                              width: Get.width,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    controller.palette?.vibrantColor?.color
                                            .withOpacity(0.25) ??
                                        AppColor.transparent,
                                    controller.palette?.darkMutedColor?.color
                                            .withOpacity(0.25) ??
                                        AppColor.black,
                                    AppColor.transparent,
                                  ],
                                  stops: const [0.2, 0.6, 1],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: Get.width * 0.9,
                                    child: Text(
                                      '${controller.getArguments['name']}',
                                      style: const TextStyle(
                                        color: AppColor.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    'Episode : ${controller.episodeData.number}',
                                    style: const TextStyle(
                                      color: AppColor.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ).paddingOnly(
                                top: 10,
                                left: 10,
                                right: 10,
                                bottom: 10,
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    bottom: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColor.white,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                  ),
                                  child: Center(
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          const WidgetSpan(
                                            child: Icon(
                                              Icons.download,
                                              size: 24,
                                              weight: 800,
                                              color: AppColor.white,
                                            ),
                                          ),
                                          WidgetSpan(
                                            child: 10.widthBox,
                                          ),
                                          const TextSpan(
                                            text: 'Download',
                                            style: TextStyle(
                                              color: AppColor.white,
                                              fontSize: 22,
                                              // height: 2,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ).onTap(
                                  () async {
                                    if (await canLaunchUrl(Uri.parse(controller
                                            .animeStreamingData.download ??
                                        ''))) {
                                      await launchUrl(
                                        Uri.parse(
                                          controller.animeStreamingData
                                                  .download ??
                                              '',
                                        ),
                                      );
                                    } else {
                                      debugPrint('failed');
                                    }
                                    // controller.downloadFile(
                                    //   controller.animeStreamingData.sources
                                    //           ?.firstWhere(
                                    //               (element) => element.quality == '1080p')
                                    //           .url ??
                                    //       '',
                                    //   controller.getArguments['name'],
                                    //   controller.episodeData.id ?? '',
                                    // );
                                    // Get.toNamed(
                                    //   Routes.downloadAnime,
                                    //   arguments: {
                                    //     'name': controller.getArguments['name'],
                                    //     'url': controller.animeStreamingData.download ?? '',
                                    //   },
                                    // );
                                  },
                                ),
                                30.heightBox,
                                getHeaderWidget(
                                  title: 'Episodes',
                                  onTap: () {},
                                ),
                                20.heightBox,
                                SizedBox(
                                  height: 170,
                                  width: Get.width,
                                  child: ListView.builder(
                                    itemCount:
                                        controller.episodeDataList.length > 40
                                            ? 40
                                            : controller.episodeDataList.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
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
                                                            .episodeDataList[
                                                                index]
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
                                              '${controller.episodeDataList[index].number}. ${controller.episodeDataList[index].title ?? ''}',
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
                                              'id': controller
                                                      .episodeDataList[index]
                                                      .id ??
                                                  '',
                                              'data': controller
                                                  .episodeDataList[index],
                                              'episodes':
                                                  controller.episodeDataList,
                                              'name': (controller
                                                      .episodeDataList[index]
                                                      .title ??
                                                  ''),
                                            },
                                          );
                                        },
                                      ).paddingOnly(
                                        left: index == 0 ? 0 : 20,
                                      );
                                    },
                                  ),
                                ),
                                if (controller.recommendationsList.isNotEmpty)
                                  getHeaderWidget(
                                    title: 'Recommendations',
                                    onTap: () {},
                                  ),
                                if (controller.recommendationsList.isNotEmpty)
                                  20.heightBox,
                                if (controller.recommendationsList.isNotEmpty)
                                  SizedBox(
                                    height: 170,
                                    width: Get.width,
                                    child: ListView.builder(
                                      itemCount: controller
                                                  .recommendationsList.length >
                                              40
                                          ? 40
                                          : controller
                                              .recommendationsList.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
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
                                                              .recommendationsList[
                                                                  index]
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
                                                '${controller.recommendationsList[index].title ?? ''}',
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
                                                'id': controller
                                                        .recommendationsList[
                                                            index]
                                                        .id ??
                                                    '',
                                                'data': controller
                                                    .recommendationsList[index],
                                                'episodes': controller
                                                    .recommendationsList,
                                                'name': (controller
                                                        .recommendationsList[
                                                            index]
                                                        .title ??
                                                    ''),
                                              },
                                            );
                                          },
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
                  ],
                ),
        );
      },
    );
  }
}
