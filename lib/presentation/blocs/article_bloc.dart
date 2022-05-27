import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_application/core/params/article_request.dart';
import 'package:new_application/core/resources/date_state.dart';
import 'package:new_application/domain/usecases/get_articale_usecase.dart';
import 'package:new_application/presentation/blocs/article_event.dart';
import 'package:new_application/presentation/blocs/article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final GetArticlesUseCase _getArticlesUseCase;
  int _page = 1;
  ArticleBloc(this._getArticlesUseCase) : super(ArticleInitialState()) {
    on<ArticleEvent>((event, emit) => hadleEvent(event, emit));
  }

  hadleEvent(event, emit) async {
    if (event is ArticleInitial) {
      emit(ArticleInitialState());
      await emitDateState(emit);
    } else if (event is ArticleAddNews) {
      emit(ArticleLoadingState());
      await emitDateState(emit);
    }
  }

  Future<void> emitDateState(emit) async {
    var lData =
        await _getArticlesUseCase(params: ArticleRequestParams(page: _page));
    _page++;
    if (lData is DateSuccess) {
      emit(ArticleReadyState(lData.data));
    } else {
      emit(ArticleErrorState((lData as DateError).error));
    }
  }
}
