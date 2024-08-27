import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:otakuclub/app/data/models/airing_schedule_response_model.dart';
import 'package:otakuclub/app/data/models/manga_list_response_model.dart';
import 'package:otakuclub/app/data/models/popular_anime_response_model.dart';
import 'package:otakuclub/app/data/models/recent_anime_episode_response_model.dart';
import 'package:otakuclub/app/data/models/suggested_anime_for_you_response_model.dart';
import 'package:otakuclub/app/data/models/trending_anime_response_model.dart';
import 'package:otakuclub/app/data/services/rest_services.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreenController extends GetxController {
  Rx<int> currentIndex = 0.obs;
  int perPageCount = 10;
  int pageIndex = 1;
  var loadingStates = <String, bool>{}.obs;
  RestService restService = RestService();
  var logger = Logger();
  Rx<SuggestedAnimeForYouResponseModel> suggestedAnimeForYouData =
      SuggestedAnimeForYouResponseModel().obs;
  RxList<TrendingAnimeData> trendingAnimeList = <TrendingAnimeData>[].obs;
  RxList<PopularAnimeData> popularAnimeList = <PopularAnimeData>[].obs;
  RxList<MangaList> mangaList = <MangaList>[].obs;
  RxList<RecentEpisodeData> recentEpisodeDataList = <RecentEpisodeData>[].obs;
  RxList<AiringScheduleAnimeData> airingScheduleAnimeList =
      <AiringScheduleAnimeData>[].obs;

  /// --> Note :- Just loading state names trending, airing, popular, manga, recentEpisode, suggested

  // --> Get Trending Anime Data
  Future<void> getTrendingAnimeData() async {
    try {
      loadingStates['trending'] = true;
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
    } catch (e) {
      loadingStates['trending'] = false;
      logger.e(
        e,
      );
    } finally {
      loadingStates['trending'] = false;
    }
    trendingAnimeList.refresh();
  }

  // --> Get Airing Schedule
  Future<void> getAiringScheuldeAnimeData() async {
    try {
      loadingStates['airing'] = true;
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
    } catch (e) {
      loadingStates['airing'] = false;
      logger.e(e);
    } finally {
      loadingStates['airing'] = false;
    }
    airingScheduleAnimeList.refresh();
  }

  // --> Get Popular Anime
  Future<void> getPopularAnimeData() async {
    try {
      loadingStates['popular'] = true;
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
    } catch (e) {
      loadingStates['popular'] = false;
      logger.e(e);
    } finally {
      loadingStates['popular'] = false;
    }

    popularAnimeList.refresh();
  }

  // --> Get Manga List
  Future<void> getMangaList() async {
    try {
      loadingStates['manga'] = true;
      var mangaListData = await restService.mangaList(
        queryParameter: {'type': 'latest'},
      );

      if ((mangaListData.mangaList ?? []).isNotEmpty) {
        mangaList.addAll(
          mangaListData.mangaList ?? [],
        );
      }
    } catch (e) {
      loadingStates['manga'] = false;
      logger.e(e);
    } finally {
      loadingStates['manga'] = false;
    }

    mangaList.refresh();
  }

  // --> Get Recent Anime Episode
  Future<void> getRecentEpisodeData() async {
    try {} catch (e) {
      loadingStates['recentEpisode'] = true;
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
      logger.e(e);
      loadingStates['recentEpisode'] = false;
    } finally {
      loadingStates['recentEpisode'] = false;
    }

    recentEpisodeDataList.refresh();
  }

  // --> Suggested Anime For You
  Future<void> getSuggestedAnimeForYouData() async {
    try {
      loadingStates['suggested'] = true;
      suggestedAnimeForYouData.value = await restService.suggestAnimeForYou();
    } catch (e) {
      loadingStates['suggested'] = false;
      logger.e(e);
    } finally {
      loadingStates['suggested'] = false;
    }
  }

  // --> Entry Point of Page
  @override
  Future<void> onInit() async {
    getTrendingAnimeData();
    getAiringScheuldeAnimeData();
    getPopularAnimeData();
    getRecentEpisodeData();
    getSuggestedAnimeForYouData();
    getMangaList();
    super.onInit();
  }

  Widget getShimmerPlaceholder({
    double? height,
    double? width,
    Widget? child,
  }) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[600]!,
      highlightColor: Colors.grey[300]!,
      child: Container(
        height: height,
        width: width,
        color: Colors.white,
        child: child,
      ),
    );
  }
}
