// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CommentModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) {
  return CommentModel()
    ..type = json['@type'] as String?
    ..category = json['@category'] as String?
    ..title = json['title'] as String?
    ..commentId = json['commentId'] as int?
    ..author = json['author'] as String?
    ..accountId = json['accountId'] as int?
    ..timestamp = json['timestamp'] as String?
    ..likeCount = json['likeCount'] as int?
    ..dislikeCount = json['dislikeCount'] as int?
    ..description = json['description'] as String?;
}

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      '@type': instance.type,
      '@category': instance.category,
      'title': instance.title,
      'commentId': instance.commentId,
      'author': instance.author,
      'accountId': instance.accountId,
      'timestamp': instance.timestamp,
      'likeCount': instance.likeCount,
      'dislikeCount': instance.dislikeCount,
      'description': instance.description,
    };
