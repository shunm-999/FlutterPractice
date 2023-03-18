import 'package:flutter/widgets.dart';
import 'package:view_qiita/common/logger.dart';
import 'package:view_qiita/data/api/entity/article.dart';
import 'package:view_qiita/repository/ArticleRepositoryImpl.dart';
import 'package:view_qiita/repository/article_repository.dart';

class ArticleListViewModel with ChangeNotifier {
  final ArticleRepository repository = ArticleRepositoryImpl();
  late List<Article> articles;

  ArticleListViewModel() {
    this.articles = [];
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    await repository.fetchArticles().then((result) {
      result.when(success: (articles) {
        this.articles = articles;
        notifyListeners();
      }, failure: (error) {
        logger.e(error.message);
      });
    });
  }
}
