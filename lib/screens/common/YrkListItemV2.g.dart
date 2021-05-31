// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'YrkListItemV2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YrkListItemV2Model _$YrkListItemV2ModelFromJson(Map<String, dynamic> json) {
  return YrkListItemV2Model()
    ..facilityType = json['facilityType'] as String?
    ..title = json['title'] as String?
    ..isBest = json['isBest'] as bool?
    ..author = json['author'] as String?
    ..timestamp = json['timestamp'] as String?
    ..likeCount = (json['likeCount'] as num?)?.toDouble()
    ..commentCount = (json['commentCount'] as num?)?.toDouble()
    ..rating = (json['rating'] as num?)?.toDouble();
}

Map<String, dynamic> _$YrkListItemV2ModelToJson(YrkListItemV2Model instance) =>
    <String, dynamic>{
      'facilityType': instance.facilityType,
      'title': instance.title,
      'isBest': instance.isBest,
      'author': instance.author,
      'timestamp': instance.timestamp,
      'likeCount': instance.likeCount,
      'commentCount': instance.commentCount,
      'rating': instance.rating,
    };
