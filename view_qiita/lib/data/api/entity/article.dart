import 'package:json_annotation/json_annotation.dart';
import 'package:view_qiita/data/api/entity/user.dart';

part 'article.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Article {
  final String id;
  final String title;
  final String url;
  final User user;

  const Article({
    required this.id,
    required this.title,
    required this.url,
    required this.user,
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
