import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otakuclub/app/core/constants/app_colors.dart';
import 'package:otakuclub/app/core/utils/extensions.dart';
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
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
                    ),
                  ),
                ],
              ).paddingOnly(
                left: 20,
                right: 20,
              ),
            ),
            30.heightBox,
            getHeaderWidget(
              title: 'Explore More',
              showArrow: false,
              fontSize: 24,
            ),
            20.heightBox,
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 3,
                ),
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
                                message: 'This Page is Still in development :(',
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
            ),
            90.heightBox,
          ],
        ).paddingOnly(
          left: 10,
          right: 10,
        ),
      ),
    );
  }
}
