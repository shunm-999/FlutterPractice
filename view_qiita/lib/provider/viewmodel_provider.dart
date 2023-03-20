import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:view_qiita/provider/repository_provider.dart';
import 'package:view_qiita/viewmodel/article_list_view_model.dart';

final articleListViewModelProvider =
    StateNotifierProvider.autoDispose<ArticleListViewModel, ArticleListUiState>(
        (ref) {
  final repository = ref.watch(articleRepositoryProvider);
  return ArticleListViewModel(repository: repository);
});
