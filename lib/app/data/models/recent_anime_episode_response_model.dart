class RecentAnimeEpisodeResponseModel {
  String? currentPage;
  int? totalResults;
  List<RecentEpisodeData>? recentEpisodeData;

  RecentAnimeEpisodeResponseModel(
      {this.currentPage, this.totalResults, this.recentEpisodeData});

  RecentAnimeEpisodeResponseModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    totalResults = json['totalResults'];
    if (json['results'] != null) {
      recentEpisodeData = <RecentEpisodeData>[];
      json['results'].forEach((v) {
        recentEpisodeData!.add(RecentEpisodeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['totalResults'] = totalResults;
    if (recentEpisodeData != null) {
      data['results'] = recentEpisodeData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RecentEpisodeData {
  String? id;
  Title? title;
  String? image;
  String? imageHash;
  String? episodeId;
  String? episodeTitle;
  int? episodeNumber;
  String? type;
  String? malId;

  RecentEpisodeData(
      {this.id,
      this.title,
      this.image,
      this.imageHash,
      this.episodeId,
      this.episodeTitle,
      this.episodeNumber,
      this.type,
      this.malId});

  RecentEpisodeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    image = json['image'];
    imageHash = json['imageHash'];
    episodeId = json['episodeId'];
    episodeTitle = json['episodeTitle'];
    episodeNumber = json['episodeNumber'];
    type = json['type'];
    malId = json['malId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    data['image'] = image;
    data['imageHash'] = imageHash;
    data['episodeId'] = episodeId;
    data['episodeTitle'] = episodeTitle;
    data['episodeNumber'] = episodeNumber;
    data['type'] = type;
    data['malId'] = malId;
    return data;
  }
}

class Title {
  String? romaji;
  String? english;
  String? native;

  Title({this.romaji, this.english, this.native});

  Title.fromJson(Map<String, dynamic> json) {
    romaji = json['romaji'];
    english = json['english'];
    native = json['native'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['romaji'] = romaji;
    data['english'] = english;
    data['native'] = native;
    return data;
  }
}
