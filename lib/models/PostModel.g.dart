// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PostModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) {
  return PostModel()
    ..postId = json['postId'] as int?
    ..category = json['category'] as String?
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
      'postId': instance.postId,
      'category': instance.category,
      'title': instance.title,
      'author': instance.author,
      'time': instance.time,
      'likeCount': instance.likeCount,
      'dislikeCount': instance.dislikeCount,
      'commentCount': instance.commentCount,
      'rating': instance.rating,
      'isBest': instance.isBest,
    };
