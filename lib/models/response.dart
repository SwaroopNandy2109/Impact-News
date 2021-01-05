import 'package:json_annotation/json_annotation.dart';

import 'article.dart';

part 'response.g.dart';

@JsonSerializable(explicitToJson: true)

class Response {

  final String status;
  final int totalResults;
  final List<Article> articles;
  @JsonKey(defaultValue: "")
  final String message;

  Response(this.status, this.totalResults, this.articles, this.message);


  factory Response.fromJson(Map<String, dynamic> json) => _$ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}