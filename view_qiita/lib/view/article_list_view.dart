import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

import '../data/api/entity/article.dart';
import '../provider/viewmodel_provider.dart';
import 'article_list.dart';

class ArticleListView extends HookConsumerWidget {
  const ArticleListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(articleListViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Article"),
      ),
      body: RefreshIndicator(
          child: _buildListView(viewModel.articles),
          onRefresh: () =>
              ref.read(articleListViewModelProvider.notifier).fetchArticles()),
    );
  }
}

Widget _buildListView(List<Article> articles) {
  return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemBuilder: (context, index) {
        return ArticleListTile(article: articles[index]);
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: articles.length);
}
