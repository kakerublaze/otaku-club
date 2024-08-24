import 'package:get/get.dart';
import 'package:otakuclub/app/modules/main/main_screen_controller.dart';

class MainScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainScreenController>(
      () => MainScreenController(),
    );
  }
}
