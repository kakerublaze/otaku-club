import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otakuclub/app/core/constants/app_colors.dart';
import 'package:otakuclub/app/core/constants/app_images.dart';
import 'package:otakuclub/app/core/constants/app_sizes.dart';
import 'package:otakuclub/app/core/constants/app_texts.dart';
import 'package:otakuclub/app/core/utils/helpers/image_helper.dart';
import 'package:otakuclub/app/modules/splash_screen/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashScreenController controller = Get.put(
      SplashScreenController(),
      permanent: true,
    );
    debugPrint(controller.a.toString());
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          color: AppColor.black,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.max,
          children: [
            const Spacer(),
            const ImageHelper(
              imagePath: AppImages.appIcon,
              color: AppColor.red,
              height: AppSizes.size80,
              width: AppSizes.size80,
            ),
            const Spacer(),
            Text(
              AppTexts.appName,
              style: GoogleFonts.pacifico(
                textStyle: const TextStyle(
                  color: AppColor.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
