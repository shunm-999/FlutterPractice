import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:view_qiita/data/api/entity/article.dart';

class ArticleListTile extends StatelessWidget {
  final Article article;

  const ArticleListTile({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipOval(
        child: Image.network(article.user.profileImageUrl,
        width: 44,
        height: 44,
        errorBuilder: (context, exception, stacktrace) {
          return const Text('Q');
        }),
      ),
      title: Text(article.title),
      onTap: () {
      },
    );
  }
}