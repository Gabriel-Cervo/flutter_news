import 'package:flutter_news/core/resources/data_state.dart';
import 'package:flutter_news/core/use_case/use_case.dart';
import 'package:flutter_news/features/daily_news/domain/entity/article.dart';
import 'package:flutter_news/features/daily_news/domain/repository/article_repository.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}
