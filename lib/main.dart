import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_application/injector.dart';
import 'package:new_application/presentation/blocs/article_bloc.dart';
import 'package:new_application/presentation/blocs/article_event.dart';
import 'package:new_application/presentation/blocs/article_state.dart';
import 'package:new_application/presentation/ui/views/news_card_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      home: BlocProvider<ArticleBloc>(
        create: (context) => injector.get<ArticleBloc>(),
        child: MainApp(),
      ),
    );
  }
}

class MainApp extends StatelessWidget {
  MainApp({
    Key? key,
  }) : super(key: key) {
    _controller.addListener(_listenerEventScrooll);
  }
  final ScrollController _controller = ScrollController();

  List<Widget> _news = [];
  bool requestStatus = true;
  _listenerEventScrooll() {
    if (_controller.position.extentAfter == 0 && requestStatus) {
      requestStatus = false;
      injector.get<ArticleBloc>().add(ArticleAddNews());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ArticleBloc, ArticleState>(builder: (context, state) {
        if (state is ArticleInitialState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ArticleReadyState) {
          if (_news.isNotEmpty && _news.last is Center) _news.removeLast();
          _news.addAll(
            state.data.map<NewsCardWidget>(
              (article) {
                return NewsCardWidget(article: article);
              },
            ),
          );
          requestStatus = true;
        } else if (state is ArticleErrorState) {
          return Center(child: Text(state.error));
        } else if (state is ArticleLoadingState) {
          if (_news.last is! Center) {
            _news.add(const Center(child: CircularProgressIndicator()));
          }
        }
        return ListView.builder(
          controller: _controller,
          itemCount: _news.length,
          itemBuilder: (context, index) {
            return _news[index];
          },
        );
      }),
    );
  }
}
