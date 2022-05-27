import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:new_application/core/params/article_request.dart';
import 'package:new_application/core/resources/date_state.dart';
import 'package:new_application/core/utils/constants.dart';
import 'package:new_application/data/models/breaking_news_response_model.dart';

class NewsApiService {
  Future<DateState> getBreakingNewsArticlesResponse({
    required ArticleRequestParams params,
  }) async {
    String request =
        '$kBaseUrl/top-headlines?country=${params.country}&category=${params.category}&page=${params.page}&pageSize=${params.pageSize}&apiKey=${params.apiKey}';
    http.Response response = await http.get(Uri.parse(request));
    if (response.statusCode == 200) {
      return DateSuccess(
        BreakingNewsResponseModel.fromJson(
          jsonDecode(response.body),
        ),
      );
    } else {
      return DateError(response.body);
    }
  }
}
