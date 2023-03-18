import 'package:view_qiita/data/api/entity/article.dart';
import 'package:view_qiita/repository/result.dart';

abstract class ArticleRepository {
  Future<Result<List<Article>>> fetchArticles();
}
