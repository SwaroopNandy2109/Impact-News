import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/models/source.dart';

part 'article.g.dart';

@JsonSerializable(explicitToJson: true)
class Article{
  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  Article(this.author, this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.content, this.source);

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}