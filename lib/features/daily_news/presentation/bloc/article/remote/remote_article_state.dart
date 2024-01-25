import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_news/features/daily_news/domain/entity/article.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioError? error;

  const RemoteArticleState({this.articles, this.error});

  @override
  List<Object?> get props => [articles!, error!];
}

/**
 * Loading state 
 */
class RemoteArticlesLoading extends RemoteArticleState {
  const RemoteArticlesLoading();
}

/**
 * Done state, after the data is succesfully fetched
 */
class RemoteArticlesDone extends RemoteArticleState {
  const RemoteArticlesDone(List<ArticleEntity> articles)
      : super(articles: articles);
}

/**
 * Error state, after the data fails to fetch
 */
class RemoteArticlesError extends RemoteArticleState {
  const RemoteArticlesError(DioError error) : super(error: error);
}
