import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:otakuclub/app/data/models/explore_list_response_model.dart';
import 'package:otakuclub/app/data/services/rest_services.dart';

class ExploreController extends GetxController {
  TextEditingController exploreController = TextEditingController();
  List<String> exploreMapDataList = [
    "Top Rated",
    "Top Popular",
    "Top Trending",
    "Calendar",
    "Top Movies",
    "Top Songs",
    "Spring",
    "Summer",
    "Fall",
    "Winter",
  ];
  RxList<ExploreListData> searchedAnimeList = <ExploreListData>[].obs;
  RestService restService = RestService();

  Future<void> searchAnime(String value) async {
    ExploreListResponseModel response = await restService.exploreListData(
      parameters: {
        'query': value.toString(),
      },
    );

    searchedAnimeList.value = response.results;
    searchedAnimeList.refresh();
  }
}
