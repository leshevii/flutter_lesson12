import 'package:new_application/domain/entities/article.dart';

abstract class ArticleState {}

class ArticleInitialState extends ArticleState {}

class ArticleLoadingState extends ArticleState {}

class ArticleReadyState extends ArticleState {
  final List<Article> data;
  ArticleReadyState(this.data);
}

class ArticleErrorState extends ArticleState {
  final String error;
  ArticleErrorState(this.error);
}
