import 'package:get/get.dart';
import 'package:otakuclub/app/data/models/airing_schedule_response_model.dart';
import 'package:otakuclub/app/data/models/manga_list_response_model.dart';
import 'package:otakuclub/app/data/models/popular_anime_response_model.dart';
import 'package:otakuclub/app/data/models/recent_anime_episode_response_model.dart';
import 'package:otakuclub/app/data/models/suggested_anime_for_you_response_model.dart';
import 'package:otakuclub/app/data/models/trending_anime_response_model.dart';
import 'package:otakuclub/app/data/services/rest_services.dart';

class HomeScreenController extends GetxController {
  Rx<int> currentIndex = 0.obs;
  int perPageCount = 10;
  int pageIndex = 1;
  RestService restService = RestService();
  Rx<SuggestedAnimeForYouResponseModel> suggestedAnimeForYouData =
      SuggestedAnimeForYouResponseModel().obs;
  RxList<TrendingAnimeData> trendingAnimeList = <TrendingAnimeData>[].obs;
  RxList<PopularAnimeData> popularAnimeList = <PopularAnimeData>[].obs;
  RxList<MangaList> mangaList = <MangaList>[].obs;
  RxList<RecentEpisodeData> recentEpisodeDataList = <RecentEpisodeData>[].obs;
  RxList<AiringScheduleAnimeData> airingScheduleAnimeList =
      <AiringScheduleAnimeData>[].obs;

  // --> Get Trending Anime Data
  Future<void> getTrendingAnimeData() async {
    var trendingAnimeData = await restService.trendingAnime(
      queryParameter: {
        'page': pageIndex.toString(),
        'perPage': perPageCount.toString(),
      },
    );

    if ((trendingAnimeData.trendingDataList ?? []).isNotEmpty) {
      trendingAnimeList.addAll(
        trendingAnimeData.trendingDataList ?? [],
      );
    }
    trendingAnimeList.refresh();
  }

  // --> Get Airing Schedule
  Future<void> getAiringScheuldeAnimeData() async {
    var airingScheduleAnimeData = await restService.airingScheduleAnime(
      queryParameter: {
        'page': pageIndex.toString(),
        'perPage': perPageCount.toString(),
        'notYetAired': true.toString(),
      },
    );

    if ((airingScheduleAnimeData.airingScheduleAnimeData ?? []).isNotEmpty) {
      airingScheduleAnimeList.addAll(
        airingScheduleAnimeData.airingScheduleAnimeData ?? [],
      );
    }
    airingScheduleAnimeList.refresh();
  }

  // --> Get Popular Anime
  Future<void> getPopularAnimeData() async {
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
    popularAnimeList.refresh();
  }

  // --> Get Manga List
  Future<void> getMangaList() async {
    var mangaListData = await restService.mangaList(
      queryParameter: {'type': 'latest'},
    );

    if ((mangaListData.mangaList ?? []).isNotEmpty) {
      mangaList.addAll(
        mangaListData.mangaList ?? [],
      );
    }
    mangaList.refresh();
  }

  // --> Get Recent Anime Episode
  Future<void> getRecentEpisodeData() async {
    var recentAnimeEpisodeList = await restService.recentAnimeEpisode(
      queryParameter: {
        'page': pageIndex.toString(),
        'perPage': perPageCount.toString(),
        'provider': 'gogoanime'
      },
    );

    if ((recentAnimeEpisodeList.recentEpisodeData ?? []).isNotEmpty) {
      recentEpisodeDataList.addAll(
        recentAnimeEpisodeList.recentEpisodeData ?? [],
      );
    }
    recentEpisodeDataList.refresh();
  }

  // --> Suggested Anime For You
  Future<void> getSuggestedAnimeForYouData() async {
    suggestedAnimeForYouData.value = await restService.suggestAnimeForYou();
  }

  // --> Entry Point of Page
  @override
  Future<void> onInit() async {
    await getTrendingAnimeData();
    await getAiringScheuldeAnimeData();
    await getPopularAnimeData();
    await getRecentEpisodeData();
    await getSuggestedAnimeForYouData();
    await getMangaList();
    super.onInit();
  }
}
