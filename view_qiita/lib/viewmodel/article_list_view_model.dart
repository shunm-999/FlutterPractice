import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:view_qiita/common/logger.dart';
import 'package:view_qiita/data/api/entity/article.dart';
import 'package:view_qiita/repository/article_repository_impl.dart';
import 'package:view_qiita/repository/article_repository.dart';

@immutable
class ArticleListUiState {
  const ArticleListUiState({required this.articles});

  final List<Article> articles;

  ArticleListUiState copyWith({List<Article>? articles}) {
    return ArticleListUiState(articles: articles ?? List.empty());
  }
}

class ArticleListViewModel extends StateNotifier<ArticleListUiState> {
  final ArticleRepository repository;

  ArticleListViewModel({required this.repository}) : super(ArticleListUiState(articles: List.empty())) {
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    await repository.fetchArticles().then((result) {
      result.when(success: (articles) {
        state = state.copyWith(articles: articles);
      }, failure: (error) {
        logger.e(error.message);
      });
    });
  }
}
