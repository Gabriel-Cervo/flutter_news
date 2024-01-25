import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/core/resources/data_state.dart';
import 'package:flutter_news/features/daily_news/domain/use_cases/get_article.dart';
import 'package:flutter_news/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:flutter_news/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class RemoteArticlesBloc extends Bloc<RemoteArticlesEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticlesBloc(this._getArticleUseCase)
      : super(const RemoteArticlesLoading()) {
    on<GetArticlesEvent>(onGetArticles);
  }

  void onGetArticles(
      GetArticlesEvent event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticlesDone(dataState.data!));
      return;
    }

    emit(RemoteArticlesError(dataState.error!));
  }
}
