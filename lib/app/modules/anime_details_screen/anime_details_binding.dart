import 'package:get/get.dart';
import 'package:otakuclub/app/modules/anime_details_screen/anime_details_controller.dart';

class AnimeDetailsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnimeDetailsPageController>(
      () => AnimeDetailsPageController(),
    );
  }
}
