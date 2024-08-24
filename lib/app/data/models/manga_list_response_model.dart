class MangaListResponseModel {
  List<MangaList>? mangaList;
  MetaData? metaData;

  MangaListResponseModel({this.mangaList, this.metaData});

  MangaListResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['mangaList'] != null) {
      mangaList = <MangaList>[];
      json['mangaList'].forEach((v) {
        mangaList!.add(MangaList.fromJson(v));
      });
    }
    metaData =
        json['metaData'] != null ? MetaData.fromJson(json['metaData']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mangaList != null) {
      data['mangaList'] = mangaList!.map((v) => v.toJson()).toList();
    }
    if (metaData != null) {
      data['metaData'] = metaData!.toJson();
    }
    return data;
  }
}

class MangaList {
  String? id;
  String? image;
  String? title;
  String? chapter;
  String? view;
  String? description;

  MangaList(
      {this.id,
      this.image,
      this.title,
      this.chapter,
      this.view,
      this.description});

  MangaList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    chapter = json['chapter'];
    view = json['view'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['title'] = title;
    data['chapter'] = chapter;
    data['view'] = view;
    data['description'] = description;
    return data;
  }
}

class MetaData {
  int? totalStories;
  int? totalPages;
  List<Type>? type;
  List<Type>? state;
  List<Type>? category;

  MetaData(
      {this.totalStories,
      this.totalPages,
      this.type,
      this.state,
      this.category});

  MetaData.fromJson(Map<String, dynamic> json) {
    totalStories = json['totalStories'];
    totalPages = json['totalPages'];
    if (json['type'] != null) {
      type = <Type>[];
      json['type'].forEach((v) {
        type!.add(Type.fromJson(v));
      });
    }
    if (json['state'] != null) {
      state = <Type>[];
      json['state'].forEach((v) {
        state!.add(Type.fromJson(v));
      });
    }
    if (json['category'] != null) {
      category = <Type>[];
      json['category'].forEach((v) {
        category!.add(Type.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalStories'] = totalStories;
    data['totalPages'] = totalPages;
    if (type != null) {
      data['type'] = type!.map((v) => v.toJson()).toList();
    }
    if (state != null) {
      data['state'] = state!.map((v) => v.toJson()).toList();
    }
    if (category != null) {
      data['category'] = category!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Type {
  String? id;
  String? name;

  Type({this.id, this.name});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
