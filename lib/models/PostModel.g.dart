// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PostModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) {
  return PostModel()
    ..type = json['@type'] as String?
    ..category = json['@category'] as String?
    ..title = json['title'] as String?
    ..postId = json['postId'] as int?
    ..label = json['label'] as String?
    ..author = json['author'] as String?
    ..accountId = json['accountId'] as int?
    ..timestamp = json['timestamp'] as String?
    ..likeCount = json['likeCount'] as int?
    ..dislikeCount = json['dislikeCount'] as int?
    ..commentCount = json['commentCount'] as int?
    ..rating = (json['rating'] as num?)?.toDouble()
    ..isBest = json['isBest'] as bool?;
}

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      '@type': instance.type,
      '@category': instance.category,
      'title': instance.title,
      'postId': instance.postId,
      'label': instance.label,
      'author': instance.author,
      'accountId': instance.accountId,
      'timestamp': instance.timestamp,
      'likeCount': instance.likeCount,
      'dislikeCount': instance.dislikeCount,
      'commentCount': instance.commentCount,
      'rating': instance.rating,
      'isBest': instance.isBest,
    };
