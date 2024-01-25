import 'package:flutter_news/core/resources/data_state.dart';
import 'package:flutter_news/features/daily_news/domain/entity/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}
