import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otakuclub/app/core/constants/app_colors.dart';
import 'package:otakuclub/app/core/utils/extensions.dart';
import 'package:otakuclub/app/core/utils/helpers/image_helper.dart';
import 'package:otakuclub/app/global_widgets/shimmers/anime_manga_page_shimmer.dart';
import 'package:otakuclub/app/modules/manga/manga_screen_controller.dart';

class MangaScreen extends StatelessWidget {
  const MangaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MangaController());
    return Obx(() {
      return Scaffold(
        body: Column(
          children: [
            90.heightBox,
            Expanded(
              child: controller.isLoadingData.value
                  ? getAnimeMangaPageShimmer()
                  : GridView.builder(
                      padding: const EdgeInsets.only(
                        right: 10,
                        left: 10,
                      ),
                      controller: controller.scrollController,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 15,
                        childAspectRatio: 0.52,
                      ),
                      itemCount: controller.latestMangaList.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            ShaderMask(
                              shaderCallback: (rect) {
                                return AppColor.cardsGradientColor.createShader(
                                  Rect.fromLTRB(
                                    0,
                                    0,
                                    Get.width,
                                    rect.height,
                                  ),
                                );
                              },
                              blendMode: BlendMode.dstOut,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                child: ImageHelper(
                                  imagePath:
                                      controller.latestMangaList[index].image ??
                                          '',
                                  height: Get.height * 0.3,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 5,
                              child: SizedBox(
                                width: Get.width * 0.3,
                                child: Text(
                                  controller.latestMangaList[index].title ?? '',
                                  maxLines: 2,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: AppColor.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
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
