import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:otakuclub/app/core/constants/app_api.dart';
import 'package:otakuclub/app/data/enums/services_enums.dart';
import 'package:otakuclub/app/data/models/airing_schedule_response_model.dart';
import 'package:otakuclub/app/data/models/anime_details_data_response_model.dart';
import 'package:otakuclub/app/data/models/anime_streaming_data_response_model.dart';
import 'package:otakuclub/app/data/models/explore_list_response_model.dart';
import 'package:otakuclub/app/data/models/manga_list_response_model.dart';
import 'package:otakuclub/app/data/models/news_details_response_model.dart';
import 'package:otakuclub/app/data/models/news_response_model.dart';
import 'package:otakuclub/app/data/models/popular_anime_response_model.dart';
import 'package:otakuclub/app/data/models/recent_anime_episode_response_model.dart';
import 'package:otakuclub/app/data/models/suggested_anime_for_you_response_model.dart';
import 'package:otakuclub/app/data/models/trending_anime_response_model.dart';

class RestService {
  // Get Data (API's Calling Point)
  static Future<http.Response> getData({
    required Uri uri,
    required Method method,
    String? body,
  }) async {
    debugPrint('Body:$body');
    final headers = <String, String>{
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer $token',
    };
    switch (method) {
      case Method.post:
        return await http.post(uri, headers: headers, body: body);
      case Method.put:
        return await http.put(uri, headers: headers, body: body);
      case Method.delete:
        return await http.delete(uri, headers: headers, body: body);
      case Method.get:
      default:
        return await http.get(uri, headers: headers);
    }
  }

  // Get Responses
  static Future<String> getResponse({
    required String uri,
    required Method method,
    bool isFromManga = false,
    Map<String, String>? queryParameters,
    String? body,
    handleTokenExpire = false,
  }) async {
    try {
      final url = Uri.https(
          isFromManga ? AppApis.mangaBaseUrl : AppApis.baseUrl,
          uri,
          queryParameters);
      var response = await getData(
        uri: url,
        method: method,
        body: body,
      ).timeout(
        const Duration(
          seconds: 180,
        ),
      );
      debugPrint(url.toString());
      if (response.statusCode == 200) {
        return response.body;
      } else if (handleTokenExpire &&
          (response.statusCode == 401 || response.statusCode == 400)) {
        debugPrint('Token Expire');
        return '';
      } else {
        return '';
      }
    } catch (e) {
      debugPrint(e.toString());
      return "";
    }
  }

  // --> Trending Anime API
  Future<TrendingAnimeResponseModel> trendingAnime(
      {Map<String, String>? queryParameter}) async {
    try {
      var response = await getResponse(
        uri: AppApis.trendingAnime,
        queryParameters: queryParameter,
        method: Method.get,
      );
      var result = TrendingAnimeResponseModel.fromJson(
        json.decode(
          response,
        ),
      );
      return result;
    } catch (e) {
      debugPrint(
        e.toString(),
      );
      return TrendingAnimeResponseModel();
    }
  }

  // --> Airing Schedule API
  Future<AiringScheduleResponseModel> airingScheduleAnime(
      {Map<String, String>? queryParameter}) async {
    try {
      var response = await getResponse(
        uri: AppApis.airingScheduleAnime,
        queryParameters: queryParameter,
        method: Method.get,
      );
      var result = AiringScheduleResponseModel.fromJson(
        json.decode(
          response,
        ),
      );
      return result;
    } catch (e) {
      debugPrint(
        e.toString(),
      );
      return AiringScheduleResponseModel();
    }
  }

  // --> Popular Anime API's
  Future<PopularResponseModel> popularAnime(
      {Map<String, String>? queryParameter}) async {
    try {
      var response = await getResponse(
        uri: AppApis.popularAnime,
        queryParameters: queryParameter,
        method: Method.get,
      );
      var result = PopularResponseModel.fromJson(
        json.decode(
          response,
        ),
      );
      return result;
    } catch (e) {
      debugPrint(
        e.toString(),
      );
      return PopularResponseModel();
    }
  }

  // --> Recent Anime Episode API's
  Future<RecentAnimeEpisodeResponseModel> recentAnimeEpisode(
      {Map<String, String>? queryParameter}) async {
    try {
      var response = await getResponse(
        uri: AppApis.recentAnimeEpisodes,
        queryParameters: queryParameter,
        method: Method.get,
      );
      var result = RecentAnimeEpisodeResponseModel.fromJson(
        json.decode(
          response,
        ),
      );
      return result;
    } catch (e) {
      debugPrint(
        e.toString(),
      );
      return RecentAnimeEpisodeResponseModel();
    }
  }

  // --> Suggest Anime For You API's
  Future<SuggestedAnimeForYouResponseModel> suggestAnimeForYou() async {
    try {
      var response = await getResponse(
        uri: AppApis.suggestedAnimeForYou,
        method: Method.get,
      );
      var result = SuggestedAnimeForYouResponseModel.fromJson(
        json.decode(
          response,
        ),
      );
      return result;
    } catch (e) {
      debugPrint(
        e.toString(),
      );
      return SuggestedAnimeForYouResponseModel();
    }
  }

  // --> Manga List API's
  Future<MangaListResponseModel> mangaList(
      {Map<String, String>? queryParameter}) async {
    try {
      var response = await getResponse(
          uri: AppApis.mangaList,
          method: Method.get,
          isFromManga: true,
          queryParameters: queryParameter);
      var result = MangaListResponseModel.fromJson(
        json.decode(
          response,
        ),
      );
      return result;
    } catch (e) {
      debugPrint(
        e.toString(),
      );
      return MangaListResponseModel();
    }
  }

  // --> Anime Details Data API's
  Future<AnimeDetailsDataResponseModel> animeDetailsData(
      {Map<String, String>? queryParameter, String? id}) async {
    try {
      var response = await getResponse(
          uri: '${AppApis.animeDetailsData}/$id',
          method: Method.get,
          queryParameters: queryParameter);
      var result = AnimeDetailsDataResponseModel.fromJson(
        json.decode(
          response,
        ),
      );
      return result;
    } catch (e) {
      debugPrint(
        e.toString(),
      );
      return AnimeDetailsDataResponseModel();
    }
  }

  // --> Anime Streaming Data API's
  Future<AnimeStreamingDataResponseModel> animeStreamingData(
      {Map<String, String>? queryParameter, String? id}) async {
    try {
      var response = await getResponse(
        uri: '${AppApis.animeStream}/$id',
        method: Method.get,
        queryParameters: queryParameter,
      );
      var result = AnimeStreamingDataResponseModel.fromJson(
        json.decode(
          response,
        ),
      );
      return result;
    } catch (e) {
      debugPrint(
        e.toString(),
      );
      return AnimeStreamingDataResponseModel();
    }
  }

  // --> Explore List API's
  Future<ExploreListResponseModel> exploreListData(
      {Map<String, String>? parameters}) async {
    try {
      var response = await getResponse(
        uri: AppApis.animeSearch,
        method: Method.get,
        queryParameters: parameters ?? {},
      );
      var result = ExploreListResponseModel.fromJson(
        json.decode(
          response,
        ),
      );
      return result;
    } catch (e) {
      debugPrint(
        e.toString(),
      );
      return ExploreListResponseModel();
    }
  }

  // --> News List API's
  Future<List<NewsResponseModel>> newsListData(
      {Map<String, String>? parameters}) async {
    try {
      var response = await getResponse(
        uri: AppApis.newsData,
        method: Method.get,
        queryParameters: parameters ?? {},
      );

      List<dynamic> jsonData = json.decode(response);
      return jsonData.map((json) => NewsResponseModel.fromJson(json)).toList();
    } catch (e) {
      debugPrint(
        e.toString(),
      );
      return [];
    }
  }

  // --> News Details API's
  Future<NewsDetailsResponseModel> newsDetailsData(
      {Map<String, String>? parameters}) async {
    try {
      var response = await getResponse(
        uri: AppApis.newsDetailsData,
        method: Method.get,
        queryParameters: parameters ?? {},
      );
      var result = NewsDetailsResponseModel.fromJson(
        json.decode(
          response,
        ),
      );
      return result;
    } catch (e) {
      debugPrint(
        e.toString(),
      );
      return NewsDetailsResponseModel();
    }
  }
}
