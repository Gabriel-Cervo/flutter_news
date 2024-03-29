import 'package:flutter_news/core/constants/constants.dart';
import 'package:flutter_news/core/resources/data_state.dart';
import 'package:flutter_news/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:flutter_news/features/daily_news/data/models/article.dart';
import 'package:flutter_news/features/daily_news/domain/repository/article_repository.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
          apiKey: newsAPIKey, country: countryQuery, category: categoryQuery);

      if (httpResponse.response.statusCode == 200) {
        return DataSuccess(httpResponse.data);
      }
      return DataFailed(DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioErrorType.response,
          requestOptions: httpResponse.response.requestOptions));
    } on DioError catch (err) {
      return DataFailed(err);
    }
  }
}
