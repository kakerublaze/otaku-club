import 'package:get/get.dart';
import 'package:otakuclub/app/modules/home/home_screen_controller.dart';
import 'package:otakuclub/app/modules/splash_screen/splash_screen_controller.dart';

class DependencyInjector {
  static init() {
    Get.lazyPut(
      () => SplashScreenController(),
      fenix: true,
    );
    Get.lazyPut(
      () => HomeScreenController(),
      fenix: true,
    );
  }
}
