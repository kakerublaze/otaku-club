import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:otakuclub/app/data/models/explore_list_response_model.dart';
import 'package:otakuclub/app/data/services/rest_services.dart';

class ExploreListController extends GetxController {
  Map<String, dynamic> getArguments = {};
  RxBool isLoading = false.obs;
  var logger = Logger();
  Rx<int> currentPage = 1.obs;
  final ScrollController scrollController = ScrollController();
  RestService restService = RestService();
  Rx<bool> isScrolled = false.obs;
  RxList<ExploreListData> exploreData = <ExploreListData>[].obs;
  ExploreListResponseModel response = ExploreListResponseModel();

  Map<String, Map<String, String>> pageParameters = {
    "Top Rated": {
      'sort': '["SCORE_DESC"]',
      'perPage': 20.toString(),
    },
    "Top Popular": {
      'sort': '["POPULARITY_DESC"]',
      'format': 'TV',
      'perPage': 20.toString(),
    },
    "Top Trending": {
      'sort': '["TRENDING_DESC"]',
      'format': 'TV',
      'perPage': 20.toString(),
    },
    "Calendar": {'': ''},
    "Top Movies": {
      'sort': '["POPULARITY_DESC"]',
      'format': 'MOVIE',
      'perPage': 20.toString(),
    },
    "Top Songs": {
      'sort': '["POPULARITY_DESC"]',
      'format': 'MUSIC',
      'perPage': 20.toString(),
    },
    "Spring": {
      'season': 'SPRING',
      'year': DateTime.now().year.toString(),
      'perPage': 20.toString(),
    },
    "Summer": {
      'season': 'SUMMER',
      'year': DateTime.now().year.toString(),
      'perPage': 20.toString(),
    },
    "Fall": {
      'season': 'FALL',
      'year': DateTime.now().year.toString(),
      'perPage': 20.toString(),
    },
    "Winter": {
      'season': 'WINTER',
      'year': DateTime.now().year.toString(),
      'perPage': 20.toString(),
    },
  };

  void _scrollListener() {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        !isLoading.value) {
      // Check if more data is available, if true then call API to fetch more data
      isLoading.value = true;
      try {
        if ((response.totalPages ?? 0) < currentPage.value) {
          currentPage.value = currentPage.value + 1;
          currentPage.refresh();
        }
        exploreListData(
          getArguments['pageName'],
        );
      } finally {
        isLoading.value = false; // Reset loading after fetching data
      }
    }
  }

  Future<void> exploreListData(String name) async {
    String getPageName = getArguments["pageName"];
    Map<String, String> parameters = pageParameters[getPageName] ?? {};
    pageParameters[getPageName]?['page'] = currentPage.value.toString();
    response = await restService.exploreListData(
      parameters: parameters,
    );
    exploreData.addAll(response.results);
    exploreData.refresh();
  }

  @override
  Future<void> onInit() async {
    currentPage.value = 1;
    getArguments = await Get.arguments;
    await exploreListData(
      getArguments['pageName'],
    );
    scrollController.addListener(_scrollListener);
    super.onInit();
  }
}
