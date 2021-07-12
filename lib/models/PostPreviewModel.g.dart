// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PostPreviewModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostPreviewModel _$PostPreviewModelFromJson(Map<String, dynamic> json) {
  return PostPreviewModel()
    ..type = json['@type'] as String?
    ..category = json['@category'] as String?
    ..boardType = json['boardType'] as String?
    ..boardLabel = json['boardLabel'] as String?
    ..title = json['title'] as String?
    ..content = json['content'] as String?
    ..profileImage = json['profileImage'] as String?
    ..author = json['author'] as String?
    ..likeCount = json['likeCount'] as int?
    ..viewCount = json['viewCount'] as int?
    ..commentCount = json['commentCount'] as int?;
}

Map<String, dynamic> _$PostPreviewModelToJson(PostPreviewModel instance) =>
    <String, dynamic>{
      '@type': instance.type,
      '@category': instance.category,
      'boardType': instance.boardType,
      'boardLabel': instance.boardLabel,
      'title': instance.title,
      'content': instance.content,
      'profileImage': instance.profileImage,
      'author': instance.author,
      'likeCount': instance.likeCount,
      'viewCount': instance.viewCount,
      'commentCount': instance.commentCount,
    };
