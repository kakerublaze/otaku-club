import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:otakuclub/app/core/utils/extensions.dart';
import 'package:otakuclub/app/modules/video_player/video_player_controller.dart';
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
              left: 10,
            ),
            centerTitle: false,
            leadingWidth: 20,
            title: SizedBox(
              // width: Get.width * 0.7,
              height: 30,
              child: Marquee(
                text: controller.getArguments['name'],
                style: const TextStyle(
                  color: AppColor.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
                scrollAxis: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                blankSpace: 20.0,
                velocity: 100.0,
                pauseAfterRound: const Duration(seconds: 1),
                startPadding: 10.0,
                decelerationDuration: const Duration(milliseconds: 500),
                decelerationCurve: Curves.easeOut,
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
          body: Column(
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
              20.heightBox,
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
                  if (await canLaunchUrl(Uri.parse(
                      controller.animeStreamingData.download ?? ''))) {
                    await launchUrl(
                      Uri.parse(
                        controller.animeStreamingData.download ?? '',
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
              20.heightBox,
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
