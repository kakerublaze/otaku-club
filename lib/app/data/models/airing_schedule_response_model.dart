class AiringScheduleResponseModel {
  int? currentPage;
  bool? hasNextPage;
  List<AiringScheduleAnimeData>? airingScheduleAnimeData;

  AiringScheduleResponseModel(
      {this.currentPage, this.hasNextPage, this.airingScheduleAnimeData});

  AiringScheduleResponseModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    hasNextPage = json['hasNextPage'];
    if (json['results'] != null) {
      airingScheduleAnimeData = <AiringScheduleAnimeData>[];
      json['results'].forEach((v) {
        airingScheduleAnimeData!.add(AiringScheduleAnimeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['hasNextPage'] = hasNextPage;
    if (airingScheduleAnimeData != null) {
      data['results'] = airingScheduleAnimeData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AiringScheduleAnimeData {
  String? id;
  int? malId;
  int? episode;
  int? airingAt;
  Title? title;
  String? country;
  String? image;
  String? imageHash;
  String? description;
  String? cover;
  String? coverHash;
  List<String>? genres;
  String? color;
  int? rating;
  int? releaseDate;
  String? type;

  AiringScheduleAnimeData(
      {this.id,
      this.malId,
      this.episode,
      this.airingAt,
      this.title,
      this.country,
      this.image,
      this.imageHash,
      this.description,
      this.cover,
      this.coverHash,
      this.genres,
      this.color,
      this.rating,
      this.releaseDate,
      this.type});

  AiringScheduleAnimeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    malId = json['malId'];
    episode = json['episode'];
    airingAt = json['airingAt'];
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    country = json['country'];
    image = json['image'];
    imageHash = json['imageHash'];
    description = json['description'];
    cover = json['cover'];
    coverHash = json['coverHash'];
    genres = json['genres'].cast<String>();
    color = json['color'];
    rating = json['rating'];
    releaseDate = json['releaseDate'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['malId'] = malId;
    data['episode'] = episode;
    data['airingAt'] = airingAt;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    data['country'] = country;
    data['image'] = image;
    data['imageHash'] = imageHash;
    data['description'] = description;
    data['cover'] = cover;
    data['coverHash'] = coverHash;
    data['genres'] = genres;
    data['color'] = color;
    data['rating'] = rating;
    data['releaseDate'] = releaseDate;
    data['type'] = type;
    return data;
  }
}

class Title {
  String? romaji;
  String? english;
  String? native;
  String? userPreferred;

  Title({this.romaji, this.english, this.native, this.userPreferred});

  Title.fromJson(Map<String, dynamic> json) {
    romaji = json['romaji'];
    english = json['english'];
    native = json['native'];
    userPreferred = json['userPreferred'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['romaji'] = romaji;
    data['english'] = english;
    data['native'] = native;
    data['userPreferred'] = userPreferred;
    return data;
  }
}
