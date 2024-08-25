class AnimeStreamingDataResponseModel {
  Headers? headers;
  List<Sources>? sources;
  String? download;

  AnimeStreamingDataResponseModel({this.headers, this.sources, this.download});

  AnimeStreamingDataResponseModel.fromJson(Map<String, dynamic> json) {
    headers =
        json['headers'] != null ? Headers.fromJson(json['headers']) : null;
    if (json['sources'] != null) {
      sources = <Sources>[];
      json['sources'].forEach((v) {
        sources!.add(Sources.fromJson(v));
      });
    }
    download = json['download'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (headers != null) {
      data['headers'] = headers!.toJson();
    }
    if (sources != null) {
      data['sources'] = sources!.map((v) => v.toJson()).toList();
    }
    data['download'] = download;
    return data;
  }
}

class Headers {
  String? referer;

  Headers({this.referer});

  Headers.fromJson(Map<String, dynamic> json) {
    referer = json['Referer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Referer'] = referer;
    return data;
  }
}

class Sources {
  String? url;
  bool? isM3U8;
  String? quality;

  Sources({this.url, this.isM3U8, this.quality});

  Sources.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    isM3U8 = json['isM3U8'];
    quality = json['quality'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['isM3U8'] = isM3U8;
    data['quality'] = quality;
    return data;
  }
}
