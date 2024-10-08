import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otakuclub/app/data/models/manga_list_response_model.dart';
import 'package:otakuclub/app/data/services/rest_services.dart';

class MangaController extends GetxController {
  int perPageCount = 30;
  Rx<int> pageIndex = 1.obs;
  var isLoading = false.obs;
  Rx<bool> isLoadingData = false.obs;
  final ScrollController scrollController = ScrollController();
  RestService restService = RestService();
  RxList<MangaList> latestMangaList = <MangaList>[].obs;

  // --> Get Latest Manga
  Future<void> getLatestMangaData() async {
    if (pageIndex.value == 1) {
      isLoadingData.value = true;
    }
    var latestMangaData = await restService.mangaList(
      queryParameter: {
        'page': pageIndex.toString(),
        'type': 'latest',
      },
    );

    if ((latestMangaData.mangaList ?? []).isNotEmpty) {
      latestMangaList.addAll(
        latestMangaData.mangaList ?? [],
      );
    }
    if (pageIndex.value == 1) {
      isLoadingData.value = false;
    }
    latestMangaList.refresh();
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
    await getLatestMangaData();
    isLoading.value = false;
  }

  @override
  Future<void> onInit() async {
    latestMangaList.clear();
    await getLatestMangaData();
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
