import 'package:get/get.dart';
import 'package:otakuclub/app/data/models/news_response_model.dart';
import 'package:otakuclub/app/data/services/rest_services.dart';

class NewsController extends GetxController {
  RxList<NewsResponseModel> newsData = <NewsResponseModel>[].obs;
  RestService restService = RestService();
  // int perPageCount = 30;
  // Rx<int> pageIndex = 1.obs;
  // var isLoading = false.obs;
  Rx<bool> isLoadingData = false.obs;
  // final ScrollController scrollController = ScrollController();

  Future<void> getNewsData() async {
    // if (pageIndex.value == 1) {
    isLoadingData.value = true;
    // }
    newsData.value = await restService.newsListData(
      parameters: {
        'topic': 'anime',
      },
    );
    // if (newsList.isNotEmpty) {
    //   newsData.addAll(
    //     newsList,
    //   );
    // }
    // if (pageIndex.value == 1)
    isLoadingData.value = false;
    newsData.refresh();
  }

  // void _scrollListener() {
  //   if (scrollController.position.pixels ==
  //       scrollController.position.maxScrollExtent) {
  //     fetchMoreData();
  //   }
  // }

  // Future<void> fetchMoreData() async {
  //   if (isLoading.value) return;

  //   isLoading.value = true;
  //   pageIndex.value++;
  //   await getNewsData();
  //   isLoading.value = false;
  // }

  @override
  void onInit() async {
    await getNewsData();
    // scrollController.addListener(_scrollListener);
    super.onInit();
  }

  @override
  void onClose() {
    // scrollController.removeListener(_scrollListener);
    // scrollController.dispose();
    super.onClose();
  }
}
