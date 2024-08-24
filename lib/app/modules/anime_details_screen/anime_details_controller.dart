import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otakuclub/app/data/models/anime_details_data_response_model.dart';
import 'package:otakuclub/app/data/services/rest_services.dart';

class AnimeDetailsPageController extends GetxController {
  Map<String, dynamic> getArguments = {};
  var isLoading = false.obs;

  final ScrollController scrollController = ScrollController();
  RestService restService = RestService();
  Rx<AnimeDetailsDataResponseModel> animeDataModel =
      AnimeDetailsDataResponseModel().obs;
  Rx<bool> isExpanded = false.obs;
  Rx<bool> isExpandedSynonyms = false.obs;
  Rx<bool> isScrolled = false.obs;

  // --> Get Latest Manga
  Future<void> animeDetailsData(String id) async {
    animeDataModel.value = await restService.animeDetailsData(
      queryParameter: {
        'provider': 'gogoanime',
      },
      id: id.toString(),
    );
    animeDataModel.refresh();
  }

  // --> Remove HTMl Tags
  String removeHtmlTags(String htmlString) {
    final RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlString.replaceAll(exp, '');
  }

  // --> Table Row
  TableRow buildTableRow(String label, Widget content) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: content,
        ),
      ],
    );
  }

  // --> Synonyms with more and less
  Widget buildSynonymsText(List<String> synonyms) {
    // Join the list of synonyms into a single string separated by commas
    String joinedSynonyms = synonyms.join('\n');

    String displayText = isExpandedSynonyms.value || joinedSynonyms.length <= 40
        ? joinedSynonyms
        : '${joinedSynonyms.substring(0, 40)}...';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          displayText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        if (joinedSynonyms.length > 40)
          InkWell(
            onTap: () {
              isExpandedSynonyms.value = !isExpandedSynonyms.value;
            },
            child: Text(
              isExpandedSynonyms.value ? 'Show less' : 'Show more',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
      ],
    );
  }

  void _scrollListener() {
    if (scrollController.position.pixels >= 140) {
      isScrolled.value = true;
      isScrolled.refresh();
    } else {
      isScrolled.value = false;
      isScrolled.refresh();
    }
  }

  @override
  Future<void> onInit() async {
    getArguments = await Get.arguments;
    await animeDetailsData(
      getArguments['id'],
    );
    scrollController.addListener(_scrollListener);
    super.onInit();
  }
}
