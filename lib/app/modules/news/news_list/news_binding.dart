import 'package:get/get.dart';
import 'package:otakuclub/app/modules/news/news_list/news_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsController>(
      () => NewsController(),
    );
  }
}
