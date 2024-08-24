import 'package:get/get.dart';
import 'package:otakuclub/app/modules/anime/anime_screen_controller.dart';

class AnimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnimeScreenController>(
      () => AnimeScreenController(),
    );
  }
}
