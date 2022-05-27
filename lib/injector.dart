import 'package:get_it/get_it.dart';
import 'package:new_application/core/params/article_request.dart';
import 'package:new_application/data/repositories/articles_repository_impl.dart';
import 'package:new_application/data/services/news_api_service.dart';
import 'package:new_application/domain/repository/article_repository.dart';
import 'package:new_application/domain/usecases/get_articale_usecase.dart';
import 'package:new_application/presentation/blocs/article_bloc.dart';
import 'package:new_application/presentation/blocs/article_event.dart';
import 'package:new_application/presentation/blocs/article_state.dart';

final injector = GetIt.instance;
initialize() async {
  injector.registerSingleton<NewsApiService>(NewsApiService());
  injector
      .registerSingleton<ArticleRepository>(ArticlesRepositoryImpl(injector()));
  injector
      .registerSingleton<GetArticlesUseCase>(GetArticlesUseCase(injector()));
  injector.registerSingleton<ArticleBloc>(ArticleBloc(injector()));
  injector.get<ArticleBloc>().add(ArticleInitial());
}
