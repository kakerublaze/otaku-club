class ExploreListResponseModel {
  int? currentPage;
  bool? hasNextPage;
  int? totalPages;
  int? totalResults;
  List<ExploreListData> results = const [];

  ExploreListResponseModel({
    this.currentPage,
    this.hasNextPage,
    this.totalPages,
    this.totalResults,
    this.results = const [],
  });

  ExploreListResponseModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    hasNextPage = json['hasNextPage'];
    totalPages = json['totalPages'];
    totalResults = json['totalResults'];
    if (json['results'] != null) {
      results = <ExploreListData>[];
      json['results'].forEach((v) {
        results.add(ExploreListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['hasNextPage'] = hasNextPage;
    data['totalPages'] = totalPages;
    data['totalResults'] = totalResults;
    data['results'] = results.map((v) => v.toJson()).toList();
    return data;
  }
}

class ExploreListData {
  String? id;
  int? malId;
  Title? title;
  String? status;
  String? image;
  String? imageHash;
  String? cover;
  String? coverHash;
  int? popularity;
  int? totalEpisodes;
  String? currentEpisode;
  String? countryOfOrigin;
  String? description;
  List<String>? genres;
  double? rating;
  String? color;
  String? type;
  String? releaseDate;

  ExploreListData(
      {this.id,
      this.malId,
      this.title,
      this.status,
      this.image,
      this.imageHash,
      this.cover,
      this.coverHash,
      this.popularity,
      this.totalEpisodes,
      this.currentEpisode,
      this.countryOfOrigin,
      this.description,
      this.genres,
      this.rating,
      this.color,
      this.type,
      this.releaseDate});

  ExploreListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    malId = json['malId'];
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    status = json['status'];
    image = json['image'];
    imageHash = json['imageHash'];
    cover = json['cover'];
    coverHash = json['coverHash'];
    popularity = json['popularity'];
    totalEpisodes = json['totalEpisodes'];
    currentEpisode = (json['currentEpisode'] ?? '').toString();
    countryOfOrigin = json['countryOfOrigin'];
    description = json['description'];
    genres = json['genres'].cast<String>();
    rating = double.parse((json['rating'] ?? 0.0).toString());
    color = json['color'];
    type = json['type'];
    releaseDate = (json['releaseDate'] ?? '').toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['malId'] = malId;
    if (title != null) {
      data['title'] = title?.toJson();
    }
    data['status'] = status;
    data['image'] = image;
    data['imageHash'] = imageHash;
    data['cover'] = cover;
    data['coverHash'] = coverHash;
    data['popularity'] = popularity;
    data['totalEpisodes'] = totalEpisodes;
    data['currentEpisode'] = currentEpisode;
    data['countryOfOrigin'] = countryOfOrigin;
    data['description'] = description;
    data['genres'] = genres;
    data['rating'] = rating;
    data['color'] = color;
    data['type'] = type;
    data['releaseDate'] = releaseDate;
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
