class NewsDetailsResponseModel {
  String? id;
  String? title;
  String? uploadedAt;
  String? intro;
  String? description;
  String? thumbnail;
  String? thumbnailHash;
  String? url;

  NewsDetailsResponseModel(
      {this.id,
      this.title,
      this.uploadedAt,
      this.intro,
      this.description,
      this.thumbnail,
      this.thumbnailHash,
      this.url});

  NewsDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    uploadedAt = json['uploadedAt'];
    intro = json['intro'];
    description = json['description'];
    thumbnail = json['thumbnail'];
    thumbnailHash = json['thumbnailHash'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['uploadedAt'] = uploadedAt;
    data['intro'] = intro;
    data['description'] = description;
    data['thumbnail'] = thumbnail;
    data['thumbnailHash'] = thumbnailHash;
    data['url'] = url;
    return data;
  }
}
