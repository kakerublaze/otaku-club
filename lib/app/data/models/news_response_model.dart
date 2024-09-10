class NewsResponseModel {
  String? title;
  String? id;
  String? uploadedAt;
  List<String>? topics;
  Preview? preview;
  String? thumbnail;
  String? thumbnailHash;
  String? url;

  NewsResponseModel(
      {this.title,
      this.id,
      this.uploadedAt,
      this.topics,
      this.preview,
      this.thumbnail,
      this.thumbnailHash,
      this.url});

  NewsResponseModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    id = json['id'];
    uploadedAt = json['uploadedAt'];
    topics = json['topics'].cast<String>();
    preview =
        json['preview'] != null ? Preview.fromJson(json['preview']) : null;
    thumbnail = json['thumbnail'];
    thumbnailHash = json['thumbnailHash'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['id'] = id;
    data['uploadedAt'] = uploadedAt;
    data['topics'] = topics;
    if (preview != null) {
      data['preview'] = preview?.toJson();
    }
    data['thumbnail'] = thumbnail;
    data['thumbnailHash'] = thumbnailHash;
    data['url'] = url;
    return data;
  }
}

class Preview {
  String? intro;
  String? full;

  Preview({this.intro, this.full});

  Preview.fromJson(Map<String, dynamic> json) {
    intro = json['intro'];
    full = json['full'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['intro'] = intro;
    data['full'] = full;
    return data;
  }
}
