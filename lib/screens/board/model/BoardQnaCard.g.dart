// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BoardQnaCard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardQnaCardModel _$BoardQnaCardModelFromJson(Map<String, dynamic> json) {
  return BoardQnaCardModel()
    ..type = json['type'] as String?
    ..title = json['title'] as String?
    ..author = json['author'] as String?
    ..timestamp = json['timestamp'] as String?
    ..likeCount = (json['likeCount'] as num?)?.toDouble()
    ..dislikeCount = (json['dislikeCount'] as num?)?.toDouble()
    ..commentCount = (json['commentCount'] as num?)?.toDouble();
}

Map<String, dynamic> _$BoardQnaCardModelToJson(BoardQnaCardModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'author': instance.author,
      'timestamp': instance.timestamp,
      'likeCount': instance.likeCount,
      'dislikeCount': instance.dislikeCount,
      'commentCount': instance.commentCount,
    };
