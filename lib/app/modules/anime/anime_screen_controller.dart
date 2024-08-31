import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otakuclub/app/data/models/popular_anime_response_model.dart';
import 'package:otakuclub/app/data/services/rest_services.dart';

class AnimeScreenController extends GetxController {
  int perPageCount = 30;
  Rx<int> pageIndex = 1.obs;
  var isLoading = false.obs;
  final ScrollController scrollController = ScrollController();
  RestService restService = RestService();
  RxList<PopularAnimeData> popularAnimeList = <PopularAnimeData>[].obs;
  Rx<bool> isLoadingData = false.obs;

  // --> Get Popular Anime
  Future<void> getPopularAnimeData() async {
    if (pageIndex.value == 1) {
      isLoadingData.value = true;
    }
    var popularAnimeData = await restService.popularAnime(
      queryParameter: {
        'page': pageIndex.toString(),
        'perPage': perPageCount.toString(),
      },
    );

    if ((popularAnimeData.popularAnimeData ?? []).isNotEmpty) {
      popularAnimeList.addAll(
        popularAnimeData.popularAnimeData ?? [],
      );
    }
    if (pageIndex.value == 1) isLoadingData.value = false;
    popularAnimeList.refresh();
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      fetchMoreData();
    }
  }

  Future<void> fetchMoreData() async {
    if (isLoading.value) return;

    isLoading.value = true;
    pageIndex.value++;
    await getPopularAnimeData();
    isLoading.value = false;
  }

  @override
  Future<void> onInit() async {
    popularAnimeList.clear();
    await getPopularAnimeData();
    scrollController.addListener(_scrollListener);
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.onClose();
  }
}
