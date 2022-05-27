import 'package:new_application/domain/entities/source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'article.freezed.dart';

@freezed
class Article with _$Article {
  factory Article({
    required Source source,
    required String? author,
    required String? title,
    required String? description,
    required String? url,
    required String? urlToImage,
    required String? publishedAt,
    required String? content,
  }) = _Article;
}
