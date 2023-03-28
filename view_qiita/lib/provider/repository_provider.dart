import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:view_qiita/repository/article_repository.dart';
import 'package:view_qiita/repository/article_repository_impl.dart';

final articleRepositoryProvider = Provider<ArticleRepository>((ref) {
  return ArticleRepositoryImpl();
});