import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otakuclub/app/data/models/news_response_model.dart';
import 'package:otakuclub/app/data/services/rest_services.dart';
import 'package:palette_generator/palette_generator.dart';

class NewsController extends GetxController {
  RxList<NewsResponseModel> newsData = <NewsResponseModel>[].obs;
  RestService restService = RestService();
  RxBool loader = false.obs;

  Future<void> getNewsData() async {
    loader.value = true;
    loader.refresh();
    newsData.value = await restService.newsListData();
    loader.value = false;
    newsData.refresh();
  }

  @override
  void onInit() async {
    await getNewsData();
    super.onInit();
  }
}
