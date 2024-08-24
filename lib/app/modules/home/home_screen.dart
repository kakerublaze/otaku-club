import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otakuclub/app/core/utils/extensions.dart';
import 'package:otakuclub/app/core/utils/helpers/image_helper.dart';
import 'package:otakuclub/app/modules/home/home_screen_controller.dart';
import 'package:otakuclub/app/routes/app_pages.dart';

import '../../core/constants/app_colors.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              color: AppColor.black,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  80.heightBox,
                  // Trending anime Slider
                  CarouselSlider(
                    items: controller.trendingAnimeList.asMap().entries.map(
                      (entry) {
                        int index = entry.key;
                        var element = entry.value;
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          child: SizedBox(
                            width: Get.width,
                            height: Get.height * 0.2,
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                  child: ShaderMask(
                                    shaderCallback: (rect) {
                                      return AppColor.getStartedGradient
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
                                      imagePath: element.image ?? '',
                                      width: Get.width,
                                      height: Get.height,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: ShaderMask(
                                    shaderCallback: (rect) {
                                      return LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Colors.white.withOpacity(0.15),
                                          Colors.white.withOpacity(0.15),
                                        ],
                                        stops: const [0.0, 1.0],
                                      ).createShader(
                                        Rect.fromLTRB(
                                            0, 0, rect.width, rect.height),
                                      );
                                    },
                                    blendMode: BlendMode.dstOver,
                                    child: Text(
                                      '#${index + 1}',
                                      style: const TextStyle(
                                        color: AppColor.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ).paddingOnly(
                                      right: 10,
                                      left: 15,
                                      top: 15,
                                      bottom: 5,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 10,
                                  child: SizedBox(
                                    width: Get.width * 0.8,
                                    child: Text(
                                      element.title?.english ??
                                          element.title?.native ??
                                          element.title?.romaji ??
                                          element.title?.userPreferred ??
                                          '',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: AppColor.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ).onTap(
                          () {
                            Get.toNamed(
                              Routes.animeDetailsScreen,
                              arguments: {
                                'id': element.id,
                              },
                            );
                          },
                        ).paddingOnly(
                          left: 10,
                          right: 10,
                        );
                      },
                    ).toList(),
                    options: CarouselOptions(
                      height: Get.height * 0.25,
                      scrollDirection: Axis.horizontal,
                      viewportFraction: 1,
                      initialPage: 0,
                      // enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 2),
                      autoPlayAnimationDuration: const Duration(
                        milliseconds: 2000,
                      ),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      onPageChanged: (index, reason) {
                        controller.currentIndex.value = index;
                      },
                    ),
                  ),
                  25.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: controller.trendingAnimeList.asMap().entries.map(
                      (entry) {
                        int index = entry.key;
                        double width;

                        if (controller.currentIndex.value == index) {
                          // Wider dot for the selected index
                          width = 35.0;
                        } else if (controller.currentIndex.value - 1 == index ||
                            controller.currentIndex.value + 1 == index) {
                          // Slightly wider dot for the adjacent indices
                          width = 20.0;
                        } else {
                          // Regular width for the rest
                          width = 10.0;
                        }

                        return GestureDetector(
                          onTap: () {
                            controller.currentIndex.value = index;
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: width,
                            height: 5,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                              color: controller.currentIndex.value == index
                                  ? Colors.blueAccent
                                  : Colors.white.withOpacity(0.2),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),

                  25.heightBox,
                  // Airing Soon
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Airing Soon',
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 26,
                        color: AppColor.white,
                      ),
                    ],
                  ),
                  10.heightBox,
                  SizedBox(
                    width: Get.width,
                    height: Get.height * 0.2,
                    child: ListView.builder(
                      itemCount: controller.airingScheduleAnimeList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final airingAt = controller
                                .airingScheduleAnimeList[index].airingAt ??
                            1;
                        final futureDateTime =
                            DateTime.fromMillisecondsSinceEpoch(
                                airingAt * 1000);
                        final now = DateTime.now();
                        final difference = futureDateTime.difference(now);

                        String displayText;
                        if (difference.inDays > 0) {
                          displayText = 'Airing in ${difference.inDays} Days';
                        } else {
                          displayText = 'Airing in ${difference.inHours} Hours';
                        }
                        return Container(
                          width: Get.width * 0.85,
                          decoration: BoxDecoration(
                            color: AppColor.white30,
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          margin: const EdgeInsets.only(
                            right: 15,
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                child: ImageHelper(
                                  imagePath: controller
                                          .airingScheduleAnimeList[index]
                                          .image ??
                                      '',
                                  height: Get.height * 0.2,
                                  width: Get.width * 0.3,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        controller
                                                .airingScheduleAnimeList[index]
                                                .title
                                                ?.english ??
                                            controller
                                                .airingScheduleAnimeList[index]
                                                .title
                                                ?.romaji ??
                                            controller
                                                .airingScheduleAnimeList[index]
                                                .title
                                                ?.native ??
                                            controller
                                                .airingScheduleAnimeList[index]
                                                .title
                                                ?.userPreferred ??
                                            'N/A',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: const TextStyle(
                                          color: AppColor.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    10.heightBox,
                                    Text(
                                      'Episode : ${controller.airingScheduleAnimeList[index].episode}',
                                      style: const TextStyle(
                                        color: AppColor.white70,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    5.heightBox,
                                    Text(
                                      displayText,
                                      style: const TextStyle(
                                        color: AppColor.white70,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    5.heightBox,
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          const WidgetSpan(
                                            child: Icon(
                                              Icons.star,
                                              color: AppColor
                                                  .white60, // Choose the color you prefer
                                              size: 20, // Adjust size as needed
                                            ),
                                          ),
                                          TextSpan(
                                            text: controller
                                                        .airingScheduleAnimeList[
                                                            index]
                                                        .rating !=
                                                    null
                                                ? '  ${controller.airingScheduleAnimeList[index].rating}%'
                                                : '  N/A',
                                            style: const TextStyle(
                                              color: AppColor.white70,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ).paddingOnly(
                                  top: 10,
                                  left: 15,
                                  right: 10,
                                  bottom: 10,
                                ),
                              ),
                              10.widthBox,
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  20.heightBox,
                  // Latest Released Episodes
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Latest Released Episodes',
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 26,
                        color: AppColor.white,
                      ),
                    ],
                  ),
                  10.heightBox,
                  SizedBox(
                    width: Get.width,
                    height: Get.height * 0.2,
                    child: ListView.builder(
                      itemCount: controller.recentEpisodeDataList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          width: Get.width * 0.85,
                          decoration: BoxDecoration(
                            color: AppColor.white30,
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          margin: const EdgeInsets.only(
                            right: 15,
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                child: ImageHelper(
                                  imagePath: controller
                                          .recentEpisodeDataList[index].image ??
                                      '',
                                  height: Get.height * 0.2,
                                  width: Get.width * 0.3,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        controller.recentEpisodeDataList[index]
                                                .title?.english ??
                                            controller
                                                .recentEpisodeDataList[index]
                                                .title
                                                ?.romaji ??
                                            controller
                                                .recentEpisodeDataList[index]
                                                .title
                                                ?.native ??
                                            'N/A',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: const TextStyle(
                                          color: AppColor.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    10.heightBox,
                                    Text(
                                      'Episode : ${controller.recentEpisodeDataList[index].episodeNumber}',
                                      style: const TextStyle(
                                        color: AppColor.white70,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    5.heightBox,
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        children: [
                                          const TextSpan(
                                            text: 'Type: ',
                                            style: TextStyle(
                                              color: AppColor.white70,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          WidgetSpan(
                                              child: Container(
                                            padding: const EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 1,
                                              bottom: 1,
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppColor.blueAccent
                                                  .withOpacity(0.6),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10,
                                              ),
                                            ),
                                            child: Text(
                                              controller
                                                          .recentEpisodeDataList[
                                                              index]
                                                          .type !=
                                                      null
                                                  ? '${controller.recentEpisodeDataList[index].type}'
                                                  : 'N/A',
                                              style: const TextStyle(
                                                color: AppColor.white70,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ).paddingOnly(
                                  top: 10,
                                  left: 15,
                                  right: 10,
                                  bottom: 10,
                                ),
                              ),
                              10.widthBox,
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  20.heightBox,
                  // Trending Now
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Trending Now',
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 26,
                        color: AppColor.white,
                      ),
                    ],
                  ),
                  10.heightBox,
                  SizedBox(
                    height: Get.height * 0.4,
                    width: Get.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.trendingAnimeList.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: Get.height * 0.4,
                          width: Get.width * 0.35,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                child: ImageHelper(
                                  imagePath: controller
                                          .trendingAnimeList[index].image ??
                                      '',
                                  height: Get.height * 0.3,
                                  width: Get.width * 0.35,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              10.heightBox,
                              Text(
                                controller.trendingAnimeList[index].title
                                        ?.english ??
                                    controller.trendingAnimeList[index].title
                                        ?.romaji ??
                                    controller.trendingAnimeList[index].title
                                        ?.native ??
                                    controller.trendingAnimeList[index].title
                                        ?.userPreferred ??
                                    '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: AppColor.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ).paddingOnly(
                          right: 20,
                        );
                      },
                    ),
                  ),
                  // Popular Anime
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular Anime',
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 26,
                        color: AppColor.white,
                      ),
                    ],
                  ),
                  10.heightBox,
                  SizedBox(
                    height: Get.height * 0.4,
                    width: Get.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.popularAnimeList.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: Get.height * 0.4,
                          width: Get.width * 0.35,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                child: ImageHelper(
                                  imagePath: controller
                                          .popularAnimeList[index].image ??
                                      '',
                                  height: Get.height * 0.3,
                                  width: Get.width * 0.35,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              10.heightBox,
                              Text(
                                controller.popularAnimeList[index].title
                                        ?.english ??
                                    controller.popularAnimeList[index].title
                                        ?.romaji ??
                                    controller.popularAnimeList[index].title
                                        ?.native ??
                                    controller.popularAnimeList[index].title
                                        ?.userPreferred ??
                                    '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: AppColor.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ).paddingOnly(
                          right: 20,
                        );
                      },
                    ),
                  ),

                  // Suggested For You
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Suggested For You',
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 26,
                        color: AppColor.white,
                      ),
                    ],
                  ),
                  10.heightBox,
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    child: SizedBox(
                      height: Get.height * 0.4,
                      width: Get.width,
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
                              imagePath: controller
                                      .suggestedAnimeForYouData.value.image ??
                                  '',
                              width: Get.width,
                              height: Get.height,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: ShaderMask(
                              shaderCallback: (rect) {
                                return LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.white.withOpacity(0.15),
                                    Colors.white.withOpacity(0.15),
                                  ],
                                  stops: const [0.0, 1.0],
                                ).createShader(
                                  Rect.fromLTRB(0, 0, rect.width, rect.height),
                                );
                              },
                              blendMode: BlendMode.dstOver,
                              child: const Text(
                                '#For You',
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                ),
                              ).paddingOnly(
                                right: 10,
                                left: 15,
                                top: 15,
                                bottom: 5,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 10,
                            child: SizedBox(
                              width: Get.width * 0.8,
                              child: Text(
                                controller
                                        .suggestedAnimeForYouData.value.title?.english ??
                                    controller.suggestedAnimeForYouData.value
                                        .title?.userPreferred ??
                                    controller.suggestedAnimeForYouData.value
                                        .title?.romaji ??
                                    controller.suggestedAnimeForYouData.value
                                        .title?.native ??
                                    '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: AppColor.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  30.heightBox,
                  // --> Manga List
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Latest Manga',
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 26,
                        color: AppColor.white,
                      ),
                    ],
                  ),
                  10.heightBox,
                  SizedBox(
                    height: Get.height * 0.4,
                    width: Get.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.mangaList.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: Get.height * 0.4,
                          width: Get.width * 0.35,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                child: ImageHelper(
                                  imagePath:
                                      controller.mangaList[index].image ?? '',
                                  height: Get.height * 0.3,
                                  width: Get.width * 0.35,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              10.heightBox,
                              Text(
                                controller.mangaList[index].title ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: AppColor.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ).paddingOnly(
                          right: 20,
                        );
                      },
                    ),
                  ),
                  100.heightBox,
                ],
              ).paddingOnly(
                left: 10,
                right: 10,
                top: 10,
                bottom: 10,
              ),
            ),
          ),
        );
      },
    );
  }
}
