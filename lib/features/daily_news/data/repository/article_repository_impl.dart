import 'package:flutter_news/core/resources/data_state.dart';
import 'package:flutter_news/features/daily_news/data/models/article.dart';
import 'package:flutter_news/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() {
    // TODO: implement getNewsArticles
    throw UnimplementedError();
  }
}
