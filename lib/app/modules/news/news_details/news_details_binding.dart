import 'package:get/get.dart';
import 'package:otakuclub/app/modules/news/news_details/news_details_controller.dart';

class NewsDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsDetailsController>(
      () => NewsDetailsController(),
    );
  }
}
