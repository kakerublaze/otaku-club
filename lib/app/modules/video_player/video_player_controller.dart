import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:otakuclub/app/data/models/anime_details_data_response_model.dart';
import 'package:otakuclub/app/data/models/anime_streaming_data_response_model.dart';
import 'package:otakuclub/app/data/services/rest_services.dart';
import 'package:palette_generator/palette_generator.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class VideoPlayerController extends GetxController {
  RestService restService = RestService();
  Rx<BetterPlayerController?> betterPlayerController =
      Rx<BetterPlayerController?>(null);
  Episodes episodeData = Episodes();
  List<Episodes> episodeDataList = [];
  List<Recommendations> recommendationsList = [];
  Map<String, dynamic> getArguments = {};
  AnimeStreamingDataResponseModel animeStreamingData =
      AnimeStreamingDataResponseModel();
  RxBool isLoading = false.obs;

  PaletteGenerator? palette;
  // --> Get AnimeStreaming Data
  Future<void> getAnimeStreamingData(String id) async {
    isLoading.value = true;
    animeStreamingData = await restService.animeStreamingData(
      id: id,
    );
    isLoading.value = false;
  }

  Future<void> requestPermissions() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      debugPrint('Permission granted');
    } else if (status.isDenied) {
      debugPrint('Permission denied');
    } else if (status.isPermanentlyDenied) {
      debugPrint('Permission permanently denied');
      // Open app settings
      await openAppSettings();
    }
  }

  // Future<void> downloadFile(
  //     String url, String folderName, String fileName) async {
  //   await requestPermissions();
  //   Directory directory = await getApplicationDocumentsDirectory();
  //   final newDirectory = Directory('${directory.path}/$folderName');
  //   if (!await newDirectory.exists()) {
  //     await newDirectory.create(recursive: true);
  //     debugPrint('Directory created at: ${directory.path}/$folderName');
  //   } else {
  //     debugPrint('Directory already exists at: ${directory.path}/$folderName');
  //   }
  //   final taskId = await FlutterDownloader.enqueue(
  //     url: url,
  //     savedDir: directory.path.isNotEmpty
  //         ? '${directory.path}/$folderName'
  //         : '/storage/emulated/0/Download',
  //     fileName: fileName,
  //     showNotification: true,
  //     openFileFromNotification: true,
  //   );
  //   debugPrint(
  //     'Download started with taskId: $taskId',
  //   );
  // }

  Future<void> colorGenerator(String url) async {
    final PaletteGenerator generator = await PaletteGenerator.fromImageProvider(
      NetworkImage(url),
    );
    palette = generator;
  }

  @override
  void onInit() async {
    getArguments = Get.arguments;
    await getAnimeStreamingData(
      getArguments['id'],
    );
    episodeData = getArguments['data'];
    episodeDataList = getArguments['episodes'];
    recommendationsList = getArguments['recommendations'] ?? [];
    await colorGenerator('${episodeData.image}');
    BetterPlayerConfiguration betterPlayerConfiguration =
        const BetterPlayerConfiguration(
      aspectRatio: 16 / 9,
      fit: BoxFit.contain,
    );

    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      animeStreamingData.sources?[0].url ?? '',
      // useAsmsSubtitles: true,
      // useAsmsTracks: true,
      videoFormat: BetterPlayerVideoFormat.hls,
      resolutions: {
        for (var source in animeStreamingData.sources ?? [])
          source.quality ?? '': source.url ?? ''
      },
    );
    betterPlayerController.value =
        BetterPlayerController(betterPlayerConfiguration);
    betterPlayerController.value?.setupDataSource(dataSource);
    super.onInit();
  }
}
