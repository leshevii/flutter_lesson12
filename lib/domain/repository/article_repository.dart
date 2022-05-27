import 'package:new_application/core/params/article_request.dart';
import 'package:new_application/core/resources/date_state.dart';

abstract class ArticleRepository {
  Future<DateState> getBreakingNewsArticles(ArticleRequestParams params);
}
