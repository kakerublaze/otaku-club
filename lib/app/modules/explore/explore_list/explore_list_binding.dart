import 'package:get/get.dart';
import 'package:otakuclub/app/modules/explore/explore_list/explore_list_controller.dart';

class ExploreListBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExploreListController>(
      () => ExploreListController(),
    );
  }
}
