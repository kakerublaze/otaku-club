import 'package:get/get.dart';
import 'package:otakuclub/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  String a = '';
  @override
  void onInit() {
    reDirectToHome();
    super.onInit();
  }

  Future<void> reDirectToHome() async {
    Future.delayed(
      const Duration(
        seconds: 2,
      ),
      () {
        Get.offAllNamed(
          Routes.mainPage,
        );
      },
    );
  }
}
