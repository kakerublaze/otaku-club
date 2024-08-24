import 'package:get/get.dart';
import 'package:otakuclub/app/modules/manga/manga_screen_controller.dart';

class MangaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MangaController>(
      () => MangaController(),
    );
  }
}
