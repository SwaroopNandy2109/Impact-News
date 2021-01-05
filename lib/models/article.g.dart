// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return Article(
    json['author'] as String ?? 'Unknown',
    json['title'] as String ?? '',
    json['description'] as String ?? '',
    json['url'] as String,
    json['urlToImage'] as String ??
        'https://cdn.dribbble.com/users/937082/screenshots/5516643/blob_4x?compress=1&resize=400x300',
    json['publishedAt'] as String,
    json['content'] as String ?? '',
    json['source'] == null
        ? null
        : Source.fromJson(json['source'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'source': instance.source?.toJson(),
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
    };
