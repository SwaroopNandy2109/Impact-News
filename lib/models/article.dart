import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/models/source.dart';

part 'article.g.dart';

@JsonSerializable(explicitToJson: true)
class Article{
  final Source source;
  @JsonKey(defaultValue: "Unknown")
  final String author;
  @JsonKey(defaultValue: "")
  final String title;
  @JsonKey(defaultValue: "")
  final String description;
  final String url;
  @JsonKey(defaultValue:"https://cdn.dribbble.com/users/937082/screenshots/5516643/blob_4x?compress=1&resize=400x300")
  final String urlToImage;
  final String publishedAt;
  @JsonKey(defaultValue: "")
  final String content;

  Article(this.author, this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.content, this.source);

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}