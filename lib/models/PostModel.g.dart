// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PostModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) {
  return PostModel()
    ..type = json['@type'] as String?
    ..category = json['@category'] as String?
    ..postId = json['postId'] as int?
    ..label = json['label'] as String?
    ..title = json['title'] as String?
    ..author = json['author'] as String?
    ..time = json['time'] as String?
    ..likeCount = json['likeCount'] as int?
    ..dislikeCount = json['dislikeCount'] as int?
    ..commentCount = json['commentCount'] as int?
    ..rating = (json['rating'] as num?)?.toDouble()
    ..isBest = json['isBest'] as bool?;
}

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      '@type': instance.type,
      '@category': instance.category,
      'postId': instance.postId,
      'label': instance.label,
      'title': instance.title,
      'author': instance.author,
      'time': instance.time,
      'likeCount': instance.likeCount,
      'dislikeCount': instance.dislikeCount,
      'commentCount': instance.commentCount,
      'rating': instance.rating,
      'isBest': instance.isBest,
    };
