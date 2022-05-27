import 'package:new_application/core/params/article_request.dart';
import 'package:new_application/core/resources/date_state.dart';
import 'package:new_application/core/usecases/usecase.dart';
import 'package:new_application/data/models/breaking_news_response_model.dart';
import 'package:new_application/domain/entities/article.dart';
import 'package:new_application/domain/entities/source.dart';
import 'package:new_application/domain/repository/article_repository.dart';

class GetArticlesUseCase implements UseCase<DateState, ArticleRequestParams> {
  final ArticleRepository _articleRepository;
  GetArticlesUseCase(this._articleRepository);

  @override
  Future<DateState> call({required ArticleRequestParams params}) async {
    var data = await _articleRepository.getBreakingNewsArticles(params);
    if (data is DateSuccess) {
      List<Article> articles = (data.data as BreakingNewsResponseModel)
          .articles
          .map<Article>((article) {
        var source = (article.source);
        return Article(
          author: article.author,
          source: Source(id: source.id, name: source.name),
          title: article.title,
          description: article.description,
          url: article.url,
          urlToImage: article.urlToImage,
          publishedAt: article.publishedAt,
          content: article.content,
        );
      }).toList();
      return DateSuccess(articles);
    }
    return DateError((data as DateError).error);
  }
}
