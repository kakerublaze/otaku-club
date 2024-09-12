import 'package:get/get.dart';
import 'package:otakuclub/app/data/models/news_details_response_model.dart';
import 'package:otakuclub/app/data/services/rest_services.dart';

class NewsDetailsController extends GetxController {
  Map<String, dynamic> getArgs = {};
  RestService restService = RestService();
  Rx<NewsDetailsResponseModel> newsData = NewsDetailsResponseModel().obs;
  Rx<bool> loader = false.obs;

  Future<void> newDetails(String id) async {
    loader.value = true;
    newsData.value = await restService.newsDetailsData(
      parameters: {'id': id},
    );
    loader.value = false;
    newsData.refresh();
  }

  @override
  void onInit() async {
    getArgs = Get.arguments;
    await newDetails(
      getArgs['id'],
    );
    super.onInit();
  }
}
