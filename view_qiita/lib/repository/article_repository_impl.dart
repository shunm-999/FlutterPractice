import 'package:dio/dio.dart';
import 'package:view_qiita/data/api/client/api_client.dart';
import 'package:view_qiita/repository/article_repository.dart';
import 'package:view_qiita/repository/result.dart';

import '../data/api/entity/article.dart';

class ArticleRepositoryImpl with ArticleRepository {
  final ApiClient _client;

  ArticleRepositoryImpl([ApiClient? client])
      : _client = client ?? ApiClient(Dio());

  @override
  Future<Result<List<Article>>> fetchArticles() {
    return _client
        .fetchArticles()
        .then((articles) => Result<List<Article>>.success(articles))
        .catchError((error) => Result<List<Article>>.failure(error));
  }
}
