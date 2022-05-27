import 'package:new_application/data/models/article_model.dart';

class BreakingNewsResponseModel {
  final String status;
  final int totalResults;
  final List<ArticleModel> articles;

  BreakingNewsResponseModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory BreakingNewsResponseModel.fromJson(Map<String, dynamic> map) {
    return BreakingNewsResponseModel(
      status: map['status'],
      totalResults: map['totalResults'],
      articles: List<ArticleModel>.from(
        (map['articles'] as List<dynamic>).map(
          (e) => ArticleModel.fromJson(e),
        ),
      ),
    );
  }
}
