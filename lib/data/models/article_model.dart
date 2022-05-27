import 'package:new_application/data/models/source_model.dart';

class ArticleModel {
  SourceModel source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  ArticleModel(
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  );
  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    SourceModel sourceModel = SourceModel.fromJson(map['source']);
    return ArticleModel(
      sourceModel,
      map['author'],
      map['title'],
      map['description'],
      map['url'],
      map['urlToImage'],
      map['publishedAt'],
      map['content'],
    );
  }
}
