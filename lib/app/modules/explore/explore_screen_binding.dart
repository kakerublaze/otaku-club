import 'package:get/get.dart';
import 'package:otakuclub/app/modules/explore/explore_screen_controller.dart';

class ExploreBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExploreController>(
      () => ExploreController(),
    );
  }
}
