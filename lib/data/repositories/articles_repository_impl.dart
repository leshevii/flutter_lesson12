import 'package:new_application/core/resources/date_state.dart';
import 'package:new_application/data/services/news_api_service.dart';
import 'package:new_application/core/params/article_request.dart';
import 'package:new_application/domain/repository/article_repository.dart';

class ArticlesRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticlesRepositoryImpl(this._newsApiService);
  @override
  Future<DateState> getBreakingNewsArticles(ArticleRequestParams params) async {
    return await _newsApiService.getBreakingNewsArticlesResponse(
      params: params,
    );
  }
}
