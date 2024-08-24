import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otakuclub/app/core/constants/app_colors.dart';
import 'package:otakuclub/app/core/utils/extensions.dart';
import 'package:otakuclub/app/core/utils/helpers/image_helper.dart';
import 'package:otakuclub/app/modules/anime/anime_screen_controller.dart';

class AnimeScreen extends StatelessWidget {
  const AnimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AnimeScreenController());
    return Obx(() {
      return Scaffold(
        body: Column(
          children: [
            90.heightBox,
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.only(
                  right: 10,
                  left: 10,
                ),
                controller: controller.scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 0.42,
                ),
                itemCount: controller.popularAnimeList.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: ImageHelper(
                          imagePath:
                              controller.popularAnimeList[index].image ?? '',
                          height: Get.height * 0.27,
                          fit: BoxFit.fill,
                        ),
                      ),
                      10.heightBox,
                      Text(
                        controller.popularAnimeList[index].title?.english ??
                            controller.popularAnimeList[index].title?.romaji ??
                            controller.popularAnimeList[index].title?.native ??
                            controller
                                .popularAnimeList[index].title?.userPreferred ??
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
                  );
                },
              ),
            ),
            if (controller.isLoading.value)
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColor.blue,
                  ),
                ),
              ),
          ],
        ),
      );
    });
  }
}
