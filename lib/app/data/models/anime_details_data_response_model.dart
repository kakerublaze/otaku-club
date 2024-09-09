class AnimeDetailsDataResponseModel {
  String? id;
  Title? title;
  int? malId;
  List<String>? synonyms;
  bool? isLicensed;
  bool? isAdult;
  String? countryOfOrigin;
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
  EndDate? endDate;
  NextAiringEpisode? nextAiringEpisode;
  int? totalEpisodes;
  int? currentEpisode;
  int? rating;
  int? duration;
  List<String>? genres;
  String? season;
  List<String>? studios;
  String? subOrDub;
  String? type;
  List<Recommendations>? recommendations;
  List<Characters>? characters;
  List<Relations>? relations;
  List<Mappings>? mappings;
  List<Artwork>? artwork;
  List<Episodes>? episodes;

  AnimeDetailsDataResponseModel(
      {this.id,
      this.title,
      this.malId,
      this.synonyms,
      this.isLicensed,
      this.isAdult,
      this.countryOfOrigin,
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
      this.nextAiringEpisode,
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
      this.mappings,
      this.artwork,
      this.episodes});

  AnimeDetailsDataResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    malId = json['malId'];
    synonyms = json['synonyms'].cast<String>();
    isLicensed = json['isLicensed'];
    isAdult = json['isAdult'];
    countryOfOrigin = json['countryOfOrigin'];
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
        json['endDate'] != null ? EndDate.fromJson(json['endDate']) : null;
    nextAiringEpisode = json['nextAiringEpisode'] != null
        ? NextAiringEpisode.fromJson(json['nextAiringEpisode'])
        : null;
    totalEpisodes = json['totalEpisodes'];
    currentEpisode = json['currentEpisode'];
    rating = json['rating'];
    duration = json['duration'];
    genres = json['genres'].cast<String>();
    season = json['season'];
    studios = json['studios'].cast<String>();
    subOrDub = json['subOrDub'];
    type = json['type'];
    if (json['recommendations'] != null) {
      recommendations = <Recommendations>[];
      json['recommendations'].forEach((v) {
        recommendations!.add(Recommendations.fromJson(v));
      });
    }
    if (json['characters'] != null) {
      characters = <Characters>[];
      json['characters'].forEach((v) {
        characters!.add(Characters.fromJson(v));
      });
    }
    if (json['relations'] != null) {
      relations = <Relations>[];
      json['relations'].forEach((v) {
        relations!.add(Relations.fromJson(v));
      });
    }
    if (json['mappings'] != null) {
      mappings = <Mappings>[];
      json['mappings'].forEach((v) {
        mappings!.add(Mappings.fromJson(v));
      });
    }
    if (json['artwork'] != null) {
      artwork = <Artwork>[];
      json['artwork'].forEach((v) {
        artwork!.add(Artwork.fromJson(v));
      });
    }
    if (json['episodes'] != null) {
      episodes = <Episodes>[];
      json['episodes'].forEach((v) {
        episodes!.add(Episodes.fromJson(v));
      });
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
    if (nextAiringEpisode != null) {
      data['nextAiringEpisode'] = nextAiringEpisode!.toJson();
    }
    data['totalEpisodes'] = totalEpisodes;
    data['currentEpisode'] = currentEpisode;
    data['rating'] = rating;
    data['duration'] = duration;
    data['genres'] = genres;
    data['season'] = season;
    data['studios'] = studios;
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
    if (mappings != null) {
      data['mappings'] = mappings!.map((v) => v.toJson()).toList();
    }
    if (artwork != null) {
      data['artwork'] = artwork!.map((v) => v.toJson()).toList();
    }
    if (episodes != null) {
      data['episodes'] = episodes!.map((v) => v.toJson()).toList();
    }
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

class EndDate {
  int? year;
  int? month;
  int? day;

  EndDate({this.year, this.month, this.day});

  EndDate.fromJson(Map<String, dynamic> json) {
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

class NextAiringEpisode {
  int? airingTime;
  int? timeUntilAiring;
  int? episode;

  NextAiringEpisode({this.airingTime, this.timeUntilAiring, this.episode});

  NextAiringEpisode.fromJson(Map<String, dynamic> json) {
    airingTime = json['airingTime'];
    timeUntilAiring = json['timeUntilAiring'];
    episode = json['episode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['airingTime'] = airingTime;
    data['timeUntilAiring'] = timeUntilAiring;
    data['episode'] = episode;
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

class Characters {
  int? id;
  String? role;
  Name? name;
  String? image;
  String? imageHash;
  List<VoiceActors>? voiceActors;

  Characters(
      {this.id,
      this.role,
      this.name,
      this.image,
      this.imageHash,
      this.voiceActors});

  Characters.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    image = json['image'];
    imageHash = json['imageHash'];
    if (json['voiceActors'] != null) {
      voiceActors = <VoiceActors>[];
      json['voiceActors'].forEach((v) {
        voiceActors!.add(VoiceActors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['role'] = role;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    data['image'] = image;
    data['imageHash'] = imageHash;
    if (voiceActors != null) {
      data['voiceActors'] = voiceActors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Name {
  String? first;
  String? last;
  String? full;
  String? native;
  String? userPreferred;

  Name({this.first, this.last, this.full, this.native, this.userPreferred});

  Name.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    full = json['full'];
    native = json['native'];
    userPreferred = json['userPreferred'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first'] = first;
    data['last'] = last;
    data['full'] = full;
    data['native'] = native;
    data['userPreferred'] = userPreferred;
    return data;
  }
}

class VoiceActors {
  int? id;
  String? language;
  Name? name;
  String? image;
  String? imageHash;

  VoiceActors({this.id, this.language, this.name, this.image, this.imageHash});

  VoiceActors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    language = json['language'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    image = json['image'];
    imageHash = json['imageHash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['language'] = language;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    data['image'] = image;
    data['imageHash'] = imageHash;
    return data;
  }
}

class Relations {
  int? id;
  String? relationType;
  int? malId;
  Title? title;
  String? status;
  int? episodes;
  String? image;
  String? imageHash;
  String? color;
  String? type;
  String? cover;
  String? coverHash;
  int? rating;

  Relations(
      {this.id,
      this.relationType,
      this.malId,
      this.title,
      this.status,
      this.episodes,
      this.image,
      this.imageHash,
      this.color,
      this.type,
      this.cover,
      this.coverHash,
      this.rating});

  Relations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    relationType = json['relationType'];
    malId = json['malId'];
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    status = json['status'];
    episodes = json['episodes'];
    image = json['image'];
    imageHash = json['imageHash'];
    color = json['color'];
    type = json['type'];
    cover = json['cover'];
    coverHash = json['coverHash'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['relationType'] = relationType;
    data['malId'] = malId;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    data['status'] = status;
    data['episodes'] = episodes;
    data['image'] = image;
    data['imageHash'] = imageHash;
    data['color'] = color;
    data['type'] = type;
    data['cover'] = cover;
    data['coverHash'] = coverHash;
    data['rating'] = rating;
    return data;
  }
}

class Mappings {
  String? id;
  String? providerId;
  double? similarity;
  String? providerType;

  Mappings({this.id, this.providerId, this.similarity, this.providerType});

  Mappings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    providerId = json['providerId'];
    similarity = double.parse(
        json['similarity'] != null ? json['similarity'].toString() : '0.0');
    providerType = json['providerType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['providerId'] = providerId;
    data['similarity'] = similarity;
    data['providerType'] = providerType;
    return data;
  }
}

class Artwork {
  String? img;
  String? type;
  String? providerId;

  Artwork({this.img, this.type, this.providerId});

  Artwork.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    type = json['type'];
    providerId = json['providerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['img'] = img;
    data['type'] = type;
    data['providerId'] = providerId;
    return data;
  }
}

class Episodes {
  String? id;
  String? title;
  String? description;
  double? number;
  String? image;
  String? imageHash;
  String? airDate;

  Episodes(
      {this.id,
      this.title,
      this.description,
      this.number,
      this.image,
      this.imageHash,
      this.airDate});

  Episodes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    number = (json['number'] ?? '0.0').toDouble();
    image = json['image'];
    imageHash = json['imageHash'];
    airDate = json['airDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['number'] = number;
    data['image'] = image;
    data['imageHash'] = imageHash;
    data['airDate'] = airDate;
    return data;
  }
}
