class SuggestedAnimeForYouResponseModel {
  String? id;
  Title? title;
  int? malId;
  List<String>? synonyms;
  bool? isLicensed;
  bool? isAdult;
  String? countryOfOrigin;
  Trailer? trailer;
  String? image;
  String? imageHash;
  int? popularity;
  String? color;
  String? cover;
  String? coverHash;
  String? description;
  String? status;
  int? releaseDate;
  StartDate? startDate;
  StartDate? endDate;
  int? totalEpisodes;
  int? currentEpisode;
  int? rating;
  int? duration;
  List<String>? genres;
  dynamic season;
  List<dynamic>? studios;
  String? subOrDub;
  String? type;
  List<Recommendations>? recommendations;
  List<dynamic>? characters;
  List<dynamic>? relations;
  List<dynamic>? episodes;

  SuggestedAnimeForYouResponseModel(
      {this.id,
      this.title,
      this.malId,
      this.synonyms,
      this.isLicensed,
      this.isAdult,
      this.countryOfOrigin,
      this.trailer,
      this.image,
      this.imageHash,
      this.popularity,
      this.color,
      this.cover,
      this.coverHash,
      this.description,
      this.status,
      this.releaseDate,
      this.startDate,
      this.endDate,
      this.totalEpisodes,
      this.currentEpisode,
      this.rating,
      this.duration,
      this.genres,
      this.season,
      this.studios,
      this.subOrDub,
      this.type,
      this.recommendations,
      this.characters,
      this.relations,
      this.episodes});

  SuggestedAnimeForYouResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    malId = json['malId'];
    synonyms = json['synonyms'].cast<String>();
    isLicensed = json['isLicensed'];
    isAdult = json['isAdult'];
    countryOfOrigin = json['countryOfOrigin'];
    trailer =
        json['trailer'] != null ? Trailer.fromJson(json['trailer']) : null;
    image = json['image'];
    imageHash = json['imageHash'];
    popularity = json['popularity'];
    color = json['color'];
    cover = json['cover'];
    coverHash = json['coverHash'];
    description = json['description'];
    status = json['status'];
    releaseDate = json['releaseDate'];
    startDate = json['startDate'] != null
        ? StartDate.fromJson(json['startDate'])
        : null;
    endDate =
        json['endDate'] != null ? StartDate.fromJson(json['endDate']) : null;
    totalEpisodes = json['totalEpisodes'];
    currentEpisode = json['currentEpisode'];
    rating = json['rating'];
    duration = json['duration'];
    genres = json['genres'].cast<String>();
    season = json['season'];
    if (json['studios'] != null) {
      studios = <dynamic>[];
      // json['studios'].forEach((v) {
      //   studios!.add(dynamic.fromJson(v));
      // });
    }
    subOrDub = json['subOrDub'];
    type = json['type'];
    if (json['recommendations'] != null) {
      recommendations = <Recommendations>[];
      json['recommendations'].forEach((v) {
        recommendations!.add(Recommendations.fromJson(v));
      });
    }
    if (json['characters'] != null) {
      characters = <dynamic>[];
      // json['characters'].forEach((v) {
      //   characters!.add(dynamic.fromJson(v));
      // });
    }
    if (json['relations'] != null) {
      relations = <dynamic>[];
      // json['relations'].forEach((v) {
      //   relations!.add(dynamic.fromJson(v));
      // });
    }
    if (json['episodes'] != null) {
      episodes = <dynamic>[];
      // json['episodes'].forEach((v) {
      //   episodes!.add(dynamic.fromJson(v));
      // });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    data['malId'] = malId;
    data['synonyms'] = synonyms;
    data['isLicensed'] = isLicensed;
    data['isAdult'] = isAdult;
    data['countryOfOrigin'] = countryOfOrigin;
    if (trailer != null) {
      data['trailer'] = trailer!.toJson();
    }
    data['image'] = image;
    data['imageHash'] = imageHash;
    data['popularity'] = popularity;
    data['color'] = color;
    data['cover'] = cover;
    data['coverHash'] = coverHash;
    data['description'] = description;
    data['status'] = status;
    data['releaseDate'] = releaseDate;
    if (startDate != null) {
      data['startDate'] = startDate!.toJson();
    }
    if (endDate != null) {
      data['endDate'] = endDate!.toJson();
    }
    data['totalEpisodes'] = totalEpisodes;
    data['currentEpisode'] = currentEpisode;
    data['rating'] = rating;
    data['duration'] = duration;
    data['genres'] = genres;
    data['season'] = season;
    if (studios != null) {
      data['studios'] = studios!.map((v) => v.toJson()).toList();
    }
    data['subOrDub'] = subOrDub;
    data['type'] = type;
    if (recommendations != null) {
      data['recommendations'] =
          recommendations!.map((v) => v.toJson()).toList();
    }
    if (characters != null) {
      data['characters'] = characters!.map((v) => v.toJson()).toList();
    }
    if (relations != null) {
      data['relations'] = relations!.map((v) => v.toJson()).toList();
    }
    if (episodes != null) {
      data['episodes'] = episodes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Trailer {
  String? id;
  String? site;
  String? thumbnail;
  String? thumbnailHash;

  Trailer({this.id, this.site, this.thumbnail, this.thumbnailHash});

  Trailer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    site = json['site'];
    thumbnail = json['thumbnail'];
    thumbnailHash = json['thumbnailHash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['site'] = site;
    data['thumbnail'] = thumbnail;
    data['thumbnailHash'] = thumbnailHash;
    return data;
  }
}

class StartDate {
  int? year;
  int? month;
  int? day;

  StartDate({this.year, this.month, this.day});

  StartDate.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    month = json['month'];
    day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['year'] = year;
    data['month'] = month;
    data['day'] = day;
    return data;
  }
}

class Recommendations {
  int? id;
  int? malId;
  Title? title;
  String? status;
  int? episodes;
  String? image;
  String? imageHash;
  String? cover;
  String? coverHash;
  int? rating;
  String? type;

  Recommendations(
      {this.id,
      this.malId,
      this.title,
      this.status,
      this.episodes,
      this.image,
      this.imageHash,
      this.cover,
      this.coverHash,
      this.rating,
      this.type});

  Recommendations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    malId = json['malId'];
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    status = json['status'];
    episodes = json['episodes'];
    image = json['image'];
    imageHash = json['imageHash'];
    cover = json['cover'];
    coverHash = json['coverHash'];
    rating = json['rating'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['malId'] = malId;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    data['status'] = status;
    data['episodes'] = episodes;
    data['image'] = image;
    data['imageHash'] = imageHash;
    data['cover'] = cover;
    data['coverHash'] = coverHash;
    data['rating'] = rating;
    data['type'] = type;
    return data;
  }
}

class Title {
  String? romaji;
  dynamic english;
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
